//
//  VBRangeAlphabet.m
//  C project
//
//  Created by Vladimir Budniy on 29.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBRangeAlphabet.h"

@interface VBRangeAlphabet ()
@property (nonatomic, assign) NSRange range;

@end

@implementation VBRangeAlphabet

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithRange:(NSRange)range {
    self = [super init];
    if (self) {
        self.range = range;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)string {
    NSRange range = self.range;
    NSUInteger location = range.location;
    
    NSMutableString *string = [NSMutableString string];
    for (NSUInteger index = location; index < location + range.length; index++) {
        [string appendString:[NSString stringWithFormat:@"%c", (unichar)index]];
    }
    
    return [string copy];
}

- (NSUInteger)count {
    return self.range.length;
}

@end
