//
//  VBNewsParser.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 29.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "IDPActiveRecordKit.h"

#import "VBNewsParser.h"
#import "VBNewsFeed.h"
#import "VBNewsModel.h"

static NSInteger newsCount;
static NSInteger const loadAmount = 550;

@interface VBNewsParser ()

@property (nonatomic, strong) NSURL          *URL;
@property (nonatomic, strong) NSMutableArray *newsArray;
@property (nonatomic, strong) NSXMLParser    *parser;
@property (nonatomic,copy)    NSString       *element;

@property (nonatomic, copy)   NSString  *currentTitle;
@property (nonatomic, copy)   NSString  *currentUrlString;
@property (nonatomic, copy)   NSString  *currentFullText;
@property (nonatomic, strong) NSDate    *currentPubDate;
@property (nonatomic, copy)   NSString  *currentCategory;

- (void)addNewsCharacters:(NSString *)string;

@end

@implementation VBNewsParser

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    self.URL = nil;
    self.newsArray = nil;
    self.parser = nil;
    self.element = nil;
    self.currentTitle = nil;
    self.currentUrlString = nil;
    self.currentFullText = nil;
    self.currentPubDate = nil;
    self.currentCategory = nil;
}

- (instancetype)initWithURL:(NSURL *)URL {
    self = [super init];
    if (self) {
        self.URL = URL;
        self.newsArray = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)setupLoad {
    @synchronized (self) {
        [self.newsArray removeAllObjects];
    }
}

- (void)prepareToLoad {
    @synchronized (self) {
        self.parser = [[NSXMLParser alloc] initWithContentsOfURL:self.URL];
        self.parser.delegate = self;
        [self.parser parse];
    }
}

- (void)finishLoad {
    @synchronized (self) {
        [self setState:kVBModelLoadedState withObject:self.newsArray];
    }
}

#pragma mark -
#pragma mark Private

- (void)addNewsCharacters:(NSString *)string {
    @synchronized (self) {
        if ([self.element isEqualToString:kVBPubDateKey]) {
            self.currentPubDate = [NSDate convertDateFromString:string];
        }
    }
}

#pragma mark -
#pragma mark NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName
     attributes:(NSDictionary *)attributeDict
{
    @synchronized (self) {
        if ([elementName isEqualToString:kVBEnclosureKey]) {
            self.currentUrlString = [attributeDict valueForKey:kVBUrlKey];
        }
        
        self.element = elementName;
    }
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock {
    @synchronized (self) {
        NSArray *removingStrings = [[NSArray alloc] initWithObjects:kVBDoubleQuote, kVBSingleQuote, kVBLineFeed, nil];
        NSArray *addingStrings = [[NSArray alloc] initWithObjects:kVBDoubleQuoteKey, kVBSingleQuoteKey, kVBLineFeedKey, nil];
        NSString *string = [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
        
        if ([self.element isEqualToString:kVBTitleKey]) {
            self.currentTitle = [NSString replaceIn:string strings:removingStrings onStrings:addingStrings];
        }
        
        if ([self.element isEqualToString:kVBFulltextKey]) {
            self.currentFullText = [NSString replaceIn:string strings:removingStrings onStrings:addingStrings];
        }
        
        if ([self.element isEqualToString:kVBCategoryKey]) {
            self.currentCategory = [NSString replaceIn:string strings:removingStrings onStrings:addingStrings];
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    @synchronized (self) {
        [self addNewsCharacters:string];
        
        if (newsCount == loadAmount) {  // This block needs for stop the parser at a certain quantity of news
            newsCount = 0;
            VBNewsFeed *newsFeed = [VBNewsFeed newsFeed];
            self.newsArray = [NSMutableArray arrayWithArray:newsFeed.news];
            [self.parser abortParsing];
        }
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    @synchronized (self) {
        if ([elementName isEqualToString:kVBItemKey]) {
            VBNewsModel *news = [VBNewsModel newsModelWithTitle:self.currentTitle
                                                       category:self.currentCategory
                                                        pubDate:self.currentPubDate
                                                       fullText:self.currentFullText
                                                      urlString:self.currentUrlString];
            
            [[VBNewsFeed newsFeed] addNewsModelsObject:news];
            newsCount +=1; // It's needs for stop the parser at a certain quantity of news
        }
        
        self.element = nil;
    }
}

@end
