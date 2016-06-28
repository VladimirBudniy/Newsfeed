//
//  NSString+VBExtension.h
//  C project
//
//  Created by Vladimir Budniy on 29.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBAlphabet.h"

extern const NSUInteger kVBStringLength;

@interface NSString (VBExtension)

// Methods with alphabet and length with default values:
// - default value for length is 4;

+ (instancetype)randomString;
+ (instancetype)randomStringWithLength:(NSUInteger)length;

// - default alphabet is alphabetWithNumbers;

+ (instancetype)randomStringWithAlphabet:(VBAlphabet *)alphabet;
+ (instancetype)randomStringWithLenght:(NSUInteger)length alphabet:(VBAlphabet *)alphabet;

@end
