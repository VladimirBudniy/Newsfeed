//
//  NSDate+VBCategory.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 29.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (VBCategory)

+ (NSDate *)dateWithString:(NSString *)stringDate dateFormate:(NSString *)dateFormate;
+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSString *)stringFromDate:(NSDate *)date
            localeIdentifier:(NSString *)localeIdentifier
                 dateFormate:(NSString *)dateFormate
              secondsFromGMT:(NSUInteger)secondsFromGMT;
+ (NSDate *)convertDateFromString:(NSString *)string;

- (NSDate *)convertDateFormate:(NSString *)dateFormate secondsFromGMT:(NSUInteger)secondsFromGMT;

@end
