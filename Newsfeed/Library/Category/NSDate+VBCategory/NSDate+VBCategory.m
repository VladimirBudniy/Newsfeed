//
//  NSDate+VBCategory.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 29.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//
#import "NSDate+VBCategory.h"

@implementation NSDate (VBCategory)

#pragma mark -
#pragma mark Class Methods

+ (NSDate *)dateWithString:(NSString *)stringDate dateFormate:(NSString *)dateFormate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormate];

    return [formatter dateFromString:stringDate];
}

+ (NSString *)stringFromDate:(NSDate *)date
            localeIdentifier:(NSString *)localeIdentifier
                 dateFormate:(NSString *)dateFormate
              secondsFromGMT:(NSUInteger)secondsFromGMT
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:localeIdentifier];
    [formatter setLocale:locale];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:secondsFromGMT]];
    [formatter setDateFormat:dateFormate];
   
    return [formatter stringFromDate:date];
}

#pragma mark -
#pragma mark Public

- (NSDate *)convertDateFormate:(NSString *)dateFormate secondsFromGMT:(NSUInteger)secondsFromGMT {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormate];
    NSString *currentStringDate = [formatter stringFromDate:self];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:secondsFromGMT]];
    
    return [formatter dateFromString:currentStringDate];
}

@end
