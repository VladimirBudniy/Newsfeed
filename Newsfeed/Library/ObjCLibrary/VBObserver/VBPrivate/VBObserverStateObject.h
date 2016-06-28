//
//  VBObserverStateObject.h
//  C project
//
//  Created by Vladimir Budniy on 13.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBObserverArray.h"
#import "VBObserver.h"

@class VBObserverArray;

@interface VBObserverStateObject : NSObject
@property (nonatomic, assign) NSUInteger    state;
@property (nonatomic, readonly) NSArray     *handlers;

+ (VBObserverStateObject *)objectWithState:(NSUInteger)state;

- (instancetype)initWithState:(NSUInteger)state;
- (void)addHandler:(VBObserverHandler)handler forObject:(id)object;
- (void)removeHandlersForObject:(id)object;

@end
