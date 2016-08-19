//
//  VBNewsFeed.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 24.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "IDPActiveRecordKit.h"

#import "VBNewsFeed.h"
#import "VBNewsModel.h"

static NSString * const kVBFileStringNameFormat = @"%@_%@";
static NSString * const kVBSortNewsKey          = @"pubDate";
static NSString * const kVBWasCreateKey         = @"wasCreate";
static NSString * const kVBPredicateFormat      = @"%K = YES";

@interface VBNewsFeed ()
- (NSString *)fileNameFromURLString:(NSString *)string ;

@end

@implementation VBNewsFeed

@dynamic wasCreate;
@dynamic news;

#pragma mark -
#pragma mark Accessors

- (NSArray *)news {
    NSArray *array = self.newsModels.allObjects;
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:kVBSortNewsKey ascending:NO];
    
    return [array sortedArrayUsingDescriptors:@[sort]];
}

- (void)setNews:(NSArray *)news {
    [self addNewsModels:[NSSet setWithArray:news]];
}

#pragma mark -
#pragma mark Class Methods

+ (instancetype)newsFeed {
    VBNewsFeed *model = [self newsFeedObject];
    if (model) {
        return model;
    }
    
    model = [self managedObject];
    model.news = [NSMutableArray array];
    model.wasCreate = YES;
    
    return model;
}

+ (instancetype)newsFeedObject {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:kVBPredicateFormat, kVBWasCreateKey];
    
    return [[[self class] fetchEntityWithSortDescriptors:nil
                                               predicate:predicate
                                           prefetchPaths:nil] firstObject];
}

#pragma mark -
#pragma mark Private

- (NSString *)fileNameFromURLString:(NSString *)string {
    NSArray *componentsArray = [string pathComponents];
    NSString *fileName = [NSString stringWithFormat:kVBFileStringNameFormat,
                          componentsArray[2], [string lastPathComponent]];
    return fileName;
}

#pragma mark - 
#pragma mark Public

- (void)cleanCache {
    NSDate *currentDate = [NSDate date];
    for (VBNewsModel *model in self.newsModels) {
        if ([model.pubDate compare:currentDate] == NSOrderedAscending) {
            NSString *fileName = [self fileNameFromURLString:model.urlString];
            if (fileName) {
                BOOL success = [NSFileManager removeFileWithName:fileName];
                if (success) {
//                    NSLog(@"photo with name %@ was removed", fileName);
                }
            }
        }
    }
}

@end
