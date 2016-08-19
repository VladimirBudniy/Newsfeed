//
//  VBNewsModel.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 24.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class VBNewsFeed;

NS_ASSUME_NONNULL_BEGIN

@interface VBNewsModel : NSManagedObject

+ (instancetype)newsModelWithTitle:(NSString *)title
                          category:(NSString *)category
                           pubDate:(NSDate *)pubDate
                          fullText:(NSString *)fullText
                         urlString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END

#import "VBNewsModel+CoreDataProperties.h"
