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

static NSString * const kVBEnclosureKey     = @"enclosure";
static NSString * const kVBUrlKey           = @"url";
static NSString * const kVBTitleKey         = @"title";
static NSString * const kVBFulltextKey      = @"fulltext";
static NSString * const kVBCategoryKey      = @"category";
static NSString * const kVBPubDateKey       = @"pubDate";
static NSString * const kVBItemKey          = @"item";

static NSUInteger const kVBNewsCount        = 80;

@interface VBNewsParser ()
@property (nonatomic, strong) NSURL          *URL;
@property (nonatomic, strong) NSMutableArray *newsArray;
@property (nonatomic, strong) NSXMLParser    *parser;
@property (nonatomic, strong) NSString       *element;

@property (nonatomic, strong) NSString  *currentTitle;
@property (nonatomic, strong) NSString  *currentUrlString;
@property (nonatomic, strong) NSString  *currentFullText;
@property (nonatomic, strong) NSString  *currentPubDate;
@property (nonatomic, strong) NSString  *currentCategory;

- (void)addNewsCharacters:(NSString *)string;

@end

@implementation VBNewsParser

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithURL:(NSURL *)URL {
    self = [super init];
    if (self) {
        self.URL = URL;
        self.newsArray = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)allNews {
    return self.newsArray;
}

#pragma mark -
#pragma mark Public

- (void)setupLoad {
    [self.newsArray removeAllObjects];
}

- (void)completionLoad {
//    VBNewsFeed *newsFeed = [VBNewsFeed newsFeedObject];
//    if (newsFeed) {
//        [newsFeed removeNews];
//        self.state = kVBModelDefaultState;
//        [self load];
//    }
    
    self.state = kVBModelDefaultState;
    [self load];
}

- (void)prepareToLoad {
    self.parser = [[NSXMLParser alloc] initWithContentsOfURL:self.URL];
    self.parser.delegate = self;
    [self.parser parse];
}

- (void)finishLoad {
//    VBNewsFeed *newsFeed = [VBNewsFeed newsFeedWithArray:self.newsArray];
//    [newsFeed saveManagedObject];
//    [self setState:kVBModelLoadedState withObject:newsFeed];
    
    [self setState:kVBModelLoadedState withObject:self];
}

#pragma mark -
#pragma mark Private

- (void)addNewsCharacters:(NSString *)string {
    if ([self.element isEqualToString:kVBTitleKey]) {
        self.currentTitle = string;
    }
    
    if ([self.element isEqualToString:kVBFulltextKey]) {
        self.currentFullText = string;
    }
    
    if ([self.element isEqualToString:kVBCategoryKey]) {
        self.currentCategory = string;
    }
    
    if ([self.element isEqualToString:kVBPubDateKey]) {
        self.currentPubDate = string;
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
    if ([elementName isEqualToString:kVBEnclosureKey]) {
        self.currentUrlString = [attributeDict valueForKey:kVBUrlKey];
    }
    
    self.element = elementName;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    [self addNewsCharacters:string];
    
    if (self.newsArray.count == kVBNewsCount) {
        [self.parser abortParsing];
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:kVBItemKey]) {
        VBNewsModel *news = [VBNewsModel newsModelWithTitle:self.currentTitle
                                                   category:self.currentCategory
                                                    pubDate:self.currentPubDate
                                                   fullText:self.currentFullText
                                                  urlString:self.currentUrlString];
        [self.newsArray addObject:news];
    }

    self.element = nil;
}

@end
