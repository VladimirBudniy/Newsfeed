//
//  VBNewsModel.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 19.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBNewsModel.h"

@implementation VBNewsModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)newsModelWithTitle:(NSString *)title
                          category:(NSString *)category
                           pubDate:(NSDate *)pubDate
                          fullText:(NSString *)fullText
                         urlString:(NSString *)urlString
{
    VBNewsModel *model = [VBNewsModel new];
    model.title = title;
    model.category = category;
    model.pubDate = pubDate;
    model.fullText = fullText;
    model.urlString = urlString;
    
    return model;
}

@end
