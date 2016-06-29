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
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"EEE, dd MMM y hh:mm:ss a zzz"];
    
    return [formatter dateFromString:stringDate];
}

@end
