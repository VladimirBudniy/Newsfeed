//
//  NSDate+VBCategory.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 29.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//
#import "NSDate+VBCategory.h"

static NSString * const kVBDateFormat                = @"MMM d, H:mm";
static NSString * const kVBUkraineLocaleIdentifier   = @"uk_BI";
static NSString * const kVBDefaultLocaleIdentifier   = @"en_US";
static NSUInteger const kVBSecondsFromGMT     = 0;

static NSString * const kVBCurrentDateFormat   = @"E, d MMM yyyy HH:mm:ss Z";
static NSString * const kVBCorrectDateFormat  = @"yyyy-MM-dd HH:mm";

@implementation NSDate (VBCategory)

#pragma mark -
#pragma mark Class Methods

+ (NSDate *)dateWithString:(NSString *)stringDate dateFormate:(NSString *)dateFormate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSLocale *locate = [[NSLocale alloc] initWithLocaleIdentifier:kVBDefaultLocaleIdentifier];
    
    [formatter setLocale:locate];
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

+ (NSString *)stringFromDate:(NSDate *)date {
    return [NSDate stringFromDate:date
                 localeIdentifier:kVBUkraineLocaleIdentifier
                      dateFormate:kVBDateFormat
                   secondsFromGMT:kVBSecondsFromGMT];
}

+ (NSDate *)convertDateFromString:(NSString *)string {
    NSDate *currentDate = [NSDate dateWithString:string dateFormate:kVBCurrentDateFormat];

    return [currentDate convertDateFormate:kVBCorrectDateFormat secondsFromGMT:kVBSecondsFromGMT];
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
