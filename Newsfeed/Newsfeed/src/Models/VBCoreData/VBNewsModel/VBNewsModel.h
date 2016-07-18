//
//  VBNewsModel.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 29.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class VBNewsImage;

NS_ASSUME_NONNULL_BEGIN

@interface VBNewsModel : NSManagedObject

+ (instancetype)newsModelWithTitle:(NSString *)title
                           category:(NSString *)category
                           pubDate:(NSDate *)pubDate
                          fullText:(NSString *)fullText
                         urlString:(NSString *)urlString;

+ (instancetype)findNewsModelWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END

#import "VBNewsModel+CoreDataProperties.h"
