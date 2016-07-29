//
//  VBNewsModel.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 24.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "IDPActiveRecordKit.h"

#import "VBNewsModel.h"
#import "VBNewsFeed.h"

static NSString * const kVBTitleKey = @"title";

@implementation VBNewsModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)newsModelWithTitle:(NSString *)title
                          category:(NSString *)category
                           pubDate:(NSString *)pubDate
                          fullText:(NSString *)fullText
                         urlString:(NSString *)urlString
{
    VBNewsModel *model = [self findNewsModelWithTitle:title];
    if (model) {
        return model;
    }
    
    model = [self managedObject];
    model.title = title;
    model.category = category;
    model.pubDate = pubDate;
    model.fullText = fullText;
    model.urlString = urlString;
    
    return model;
}

+ (instancetype)findNewsModelWithTitle:(NSString *)title {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@", kVBTitleKey, title];
    
    return [[[self class] fetchEntityWithSortDescriptors:nil
                                               predicate:predicate
                                           prefetchPaths:nil] firstObject];
}


@end
