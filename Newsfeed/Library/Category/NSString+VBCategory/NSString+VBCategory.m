//
//  NSString+VBExtension.m
//  C project
//
//  Created by Vladimir Budniy on 29.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "NSString+VBCategory.h"

const NSUInteger kVBStringLength = 4;

@implementation NSString (VBExtension)

+ (instancetype)randomString {
    return [self randomStringWithLength:arc4random_uniform(kVBStringLength) + kVBStringLength];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLenght:length alphabet:[VBAlphabet alphabetWithUppercaseLettersRange]];
}

+ (instancetype)randomStringWithAlphabet:(VBAlphabet *)alphabet {
    NSUInteger lenght = arc4random_uniform((uint32_t)alphabet.string.length) + 1;
    
    return [self randomStringWithLenght:lenght alphabet:alphabet];
}

+ (instancetype)randomStringWithLenght:(NSUInteger)length alphabet:(VBAlphabet *)alphabet {
    NSMutableString *string = [NSMutableString string];
    
    for (NSUInteger index = 0; index < length; index++) {
        NSUInteger charIndex = arc4random_uniform((uint32_t)alphabet.count - 1);
        unichar charValue = [alphabet.string characterAtIndex:charIndex];
        [string appendString:[NSString stringWithFormat:@"%c", charValue]];
    }
    
    return [string mutableCopy];
}

@end
