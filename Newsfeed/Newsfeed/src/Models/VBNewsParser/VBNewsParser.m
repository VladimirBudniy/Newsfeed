//
//  VBNewsParser.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 29.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBNewsParser.h"
#import "VBNewsModel.h"

static NSString * const kVBEnclosureKey     = @"enclosure";
static NSString * const kVBUrlKey           = @"url";
static NSString * const kVBTitleKey         = @"title";
static NSString * const kVBFulltextKey      = @"fulltext";
static NSString * const kVBCategoryKey      = @"category";
static NSString * const kVBPubDateKey       = @"pubDate";
static NSString * const kVBItemKey          = @"item";

static NSString * const kVBCurrentDateFormat  = @"E, d MMM yyyy HH:mm:ss Z";
static NSString * const kVBCorrectDateFormate = @"yyyy-MM-dd HH:mm";
static NSUInteger const kVBSecondsFromGMT     = 0;

@interface VBNewsParser ()
@property (nonatomic, strong) NSMutableArray *newsArray;
@property (nonatomic, strong) NSXMLParser    *parser;
@property (nonatomic, strong) NSString       *element;
@property (nonatomic, strong) NSURL          *URL;

@property (nonatomic, strong) NSString  *currentTitle;
@property (nonatomic, strong) NSString  *currentUrlString;
@property (nonatomic, strong) NSString  *currentFullText;
@property (nonatomic, strong) NSDate    *currentPubDate;
@property (nonatomic, strong) NSString  *currentCategory;

@end

@implementation VBNewsParser

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithURL:(NSURL *)URL {
    self = [super init];
    if (self) {
        self.URL = URL;
        self.newsArray = [NSMutableArray array];
//        self.newsDictionary = [NSMutableDictionary dictionary];  ////////////////////////////////////////////////
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
//    [self.newsDictionary removeAllObjects];  ////////////////////////////////////////////////
    [self.newsArray removeAllObjects];
}

- (void)prepareToLoad {
    // убрать задвоение селф.парсер
    self.parser = [[NSXMLParser alloc] initWithContentsOfURL:self.URL];
    self.parser.delegate = self;
    [self.parser parse];
}

- (void)finishLoad {
    [self setState:kVBModelLoadedState withObject:self];
    [self.parser abortParsing];
}

#pragma mark -
#pragma mark NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName
     attributes:(NSDictionary *)attributeDict
{
    self.element = elementName;
    if ([self.element isEqualToString:kVBEnclosureKey]) {
        self.currentUrlString = [attributeDict valueForKey:kVBUrlKey];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([self.element isEqualToString:kVBTitleKey]) {
        self.currentTitle = string;
    } else if ([self.element isEqualToString:kVBFulltextKey]) {
        self.currentFullText = string;
    } else if ([self.element isEqualToString:kVBCategoryKey]) {
        self.currentCategory = string;
    } else if ([self.element isEqualToString:kVBPubDateKey]) {
        NSDate *currentDate = [NSDate dateWithString:string dateFormate:kVBCurrentDateFormat];
        self.currentPubDate = [currentDate convertDateFormate:kVBCorrectDateFormate
                                               secondsFromGMT:kVBSecondsFromGMT];
        //если дата ранее чем сегодня прервать парсинг
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

//        [self.newsDictionary setObject:news forKey:self.currentCategory];  /////////////////////////
        [self.newsArray addObject:news];
    }

    self.element = nil;
}

@end
