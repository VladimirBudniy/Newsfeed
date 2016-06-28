//
//  VBObserver.m
//  C project
//
//  Created by Vladimir Budniy on 15.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserver.h"
#import "VBObserverStateObject.h"
#import "VBObserverArray.h"
#import "VBObserverObject.h"

@interface VBObserver ()
@property (nonatomic, retain) NSMutableArray *stateObjects;

- (VBObserverStateObject *)objectWithState:(NSUInteger)state;
- (void)performHandlersWithObject:(id)object;

@end

@implementation VBObserver

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    [self.stateObjects removeAllObjects];
    self.stateObjects = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = 0;
        self.object = nil;
        self.stateObjects = [NSMutableArray array];
    }
    
    return self;
}

- (instancetype)initWithState:(NSUInteger)state {
    self = [self init];
    if (self) {
        self.state = state;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(NSUInteger)state {
    [self setState:state withObject:nil];
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    @synchronized(self) {
        if (_state != state) {
            _state = state;
        }
        
        [self performHandlersWithObject:object];
    }
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(VBObserverHandler)handler forState:(NSUInteger)state object:(id)object {
    if (object) {
        VBObserverStateObject *stateObject = [self objectWithState:state];
        [stateObject addHandler:[handler copy] forObject:object];
    }
}

- (void)removeHandlersForState:(NSUInteger)state {
    VBObserverStateObject *stateObject = [self objectWithState:state];
    [self.stateObjects removeObject:stateObject];
}

- (void)removeHandlersForObject:(id)object {
    if (object) {
        for (VBObserverStateObject *stateObject in self.stateObjects) {
            [stateObject removeHandlersForObject:object];
        }
    }
}

#pragma mark - 
#pragma mark Private

- (VBObserverStateObject *)objectWithState:(NSUInteger)state {
    for (VBObserverStateObject *stateObject in self.stateObjects) {
        if (stateObject.state == state) {
            return stateObject;
        }
    }
    
    VBObserverStateObject *staetObject = [VBObserverStateObject objectWithState:state];
    [self.stateObjects addObject:staetObject];
    
    return staetObject;
}

- (void)performHandlersWithObject:(id)object {
    for (VBObserverStateObject *stateObject in self.stateObjects) {
        if (stateObject.state == _state) {
            for (VBObserverHandler handler in stateObject.handlers) {
                handler(object);
            }
        }
    }
}

@end
