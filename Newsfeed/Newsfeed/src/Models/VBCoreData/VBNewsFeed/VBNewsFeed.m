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

static NSString * const kVBSortNewsKey    = @"pubDate";
static NSString * const kVBWasCreateKey   = @"wasCreate";

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

//+ (instancetype)newsFeedWithArray:(NSArray *)news {
//    VBNewsFeed *model = [self newsFeedObject];
//    if (model) {
//        return model;
//    }
//    
//    model = [self managedObject];
//    model.news = news;
//    model.wasCreate = YES;
//    
//    return model;
//}

+ (instancetype)newsFeed {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = YES", kVBWasCreateKey];
    VBNewsFeed *model = [[[self class] fetchEntityWithSortDescriptors:nil
                                                            predicate:predicate
                                                        prefetchPaths:nil] firstObject];
    if (model) {
        return model;
    }
    
    model = [self managedObject];
    model.news = [NSMutableArray array];
    model.wasCreate = YES;
    
    return model;
}

//+ (instancetype)newsFeedObject {
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = YES", kVBWasCreateKey];
//    
//    return [[[self class] fetchEntityWithSortDescriptors:nil
//                                               predicate:predicate
//                                           prefetchPaths:nil] firstObject];
//}

#pragma mark - 
#pragma mark Public

- (void)removeNews {
    NSArray *newsArray = self.newsModels.allObjects;
    [self removeNewsModels:[NSSet setWithArray:newsArray]];
}

@end
