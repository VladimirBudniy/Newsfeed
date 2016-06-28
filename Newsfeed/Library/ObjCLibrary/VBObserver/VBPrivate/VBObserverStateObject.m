//
//  VBObserverStateObject.m
//  C project
//
//  Created by Vladimir Budniy on 13.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserverStateObject.h"

@interface VBObserverStateObject ()
@property (nonatomic, retain) VBObserverArray *observerArray;

@end

@implementation VBObserverStateObject

#pragma mark -
#pragma mark Class Methods

+ (VBObserverStateObject *)objectWithState:(NSUInteger)state {
    return [[VBObserverStateObject alloc] initWithState:state];
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithState:(NSUInteger)state{
    self = [super init];
    if (self) {
        self.state = state;
        self.observerArray = [VBObserverArray new];
    }
    
    return self;
}


#pragma mark -
#pragma mark Accessors

- (NSArray *)handlers {
    return self.observerArray.handlers;
}

#pragma mark - 
#pragma mark Public

- (void)addHandler:(VBObserverHandler)handler forObject:(id)object {
    [self.observerArray addHandler:handler forObject:object];
}

- (void)removeHandlersForObject:(id)object {
    [self.observerArray removeHandlersForObject:object];
}

@end
