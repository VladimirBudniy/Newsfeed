//
//  VBObserverObject.m
//  C project
//
//  Created by Vladimir Budniy on 12.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserverObject.h"

@implementation VBObserverObject

#pragma mark -
#pragma mark Class Methods

+ (VBObserverObject *)objectWithObject:(id)object handler:(VBObserverHandler)handler {
    return [[VBObserverObject alloc] initWithObject:object handler:handler];
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithObject:(id)object handler:(VBObserverHandler)handler {
    self = [super init];
    if (self) {
        self.object = object;
        self.handler = handler;
    }
    
    return self;
}

@end
