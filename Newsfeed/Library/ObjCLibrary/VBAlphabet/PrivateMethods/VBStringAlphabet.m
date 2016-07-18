//
//  VBStringAlphabet.m
//  C project
//
//  Created by Vladimir Budniy on 02.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBStringAlphabet.h"

@interface VBStringAlphabet ()
@property (nonatomic, copy) NSString *stringAlphabet;

@end

@implementation VBStringAlphabet

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    self.stringAlphabet = nil;
}

- (instancetype)initWithString:(NSString *)stringAlphabet {
    self = [super init];
    if (self) {
        self.stringAlphabet = stringAlphabet;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)string {
    return [self.stringAlphabet copy];
}

- (NSUInteger)count {
    return self.string.length;
}

@end
