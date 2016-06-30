//
//  NSDate+VBCategory.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 29.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kVBCurrentDateFormat;
extern NSString * const kVBCorrectDateFormate;

@interface NSDate (VBCategory)

+ (NSDate *)dateWithString:(NSString *)date;

@end
