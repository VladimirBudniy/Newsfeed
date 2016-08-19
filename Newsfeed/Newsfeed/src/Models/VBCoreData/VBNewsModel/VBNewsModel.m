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

@interface VBNewsModel ()
+ (instancetype)findNewsModelWithTitle:(NSString *)title;

@end


@implementation VBNewsModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)newsModelWithTitle:(NSString *)title
                          category:(NSString *)category
                           pubDate:(NSDate *)pubDate
                          fullText:(NSString *)fullText
                         urlString:(NSString *)urlString
{
    VBNewsModel *model = [self findNewsModelWithTitle:title];
    if (model) {
        return model;
    }
    
    model = [self managedObject];
    model.title = title;
    model.newsCategory = category;
    model.pubDate = pubDate;
    model.fullText = fullText;
    model.urlString = urlString;
    
    return model;
}

#pragma mark -
#pragma mark Private

+ (instancetype)findNewsModelWithTitle:(NSString *)title {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@", kVBTitleKey, title];
    
    return [[[self class] fetchEntityWithSortDescriptors:nil
                                               predicate:predicate
                                           prefetchPaths:nil] firstObject];
}


@end
