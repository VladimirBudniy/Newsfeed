//
//  VBNewsParser.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 29.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBNewsParser.h"
#import "VBNewsModel.h"

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

- (void)parseXML {
    self.parser = [[NSXMLParser alloc] initWithContentsOfURL:self.URL];
    self.parser.delegate = self;
    
    [self.parser parse];
}

#pragma mark -
#pragma mark NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(nullable NSString *)namespaceURI
  qualifiedName:(nullable NSString *)qName
     attributes:(NSDictionary *)attributeDict
{
    self.element = elementName;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([self.element isEqualToString:@"title"]) {
        self.currentTitle = string;
    } else if ([self.element isEqualToString:@"fulltext"]) {
        self.currentFullText = string;
    } else if ([self.element isEqualToString:@"category"]) {
        self.currentCategory = string;
    } else if ([self.element isEqualToString:@"pubDate"]) {
        self.currentPubDate = [NSDate dateWithString:string];
    } else if ([self.element isEqualToString:@"enclosure"]) { ///////////////
        self.currentUrlString = string;
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(nullable NSString *)namespaceURI
 qualifiedName:(nullable NSString *)qName
{
    if ([elementName isEqualToString:@"item"]) {
        VBNewsModel *news = [VBNewsModel newsModelWithTitle:self.currentTitle
                                                   category:self.currentCategory
                                                    pubDate:self.currentPubDate
                                                   fullText:self.currentFullText
                                                  urlString:self.currentUrlString];
        
        [self.newsArray addObject:news];
    }
    self.element = nil;
    
//    [self setState:kVBModelLoadedState withObject:self];
}

@end
