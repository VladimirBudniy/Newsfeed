//
//  VBArrayAlphabet.m
//  C project
//
//  Created by Vladimir Budniy on 02.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBArrayAlphabet.h"

@interface VBArrayAlphabet ()
@property (nonatomic, retain) NSArray * array;

@end

@implementation VBArrayAlphabet

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    self.array = nil;
}

- (instancetype)initWithAlphabets:(NSArray *)array {
    self = [super init];
    if (self) {
        self.array = array;
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)string {
    NSArray *array = self.array;
    
    NSMutableString *mutableString = [NSMutableString string];
    for (VBAlphabet *alphabet in array) {
        [mutableString appendString:alphabet.string];
    }
    
    return [mutableString copy];
}

- (NSUInteger)count {
    return self.string.length;
}

@end
