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

+ (NSDate *)dateWithString:(NSString *)stringDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:kVBCurrentDateFormat];
    NSDate *currentDate  = [formatter dateFromString:stringDate];
    
//     Convert to new Date Format
    [formatter setDateFormat:kVBCorrectDateFormate];
    NSString *currentStringDate = [formatter stringFromDate:currentDate];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSDate *correctDate = [formatter dateFromString:currentStringDate];
    
    return correctDate;
}

@end
