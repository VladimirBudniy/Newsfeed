//
//  VBObserver.h
//  C project
//
//  Created by Vladimir Budniy on 15.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^VBObserverHandler)(id object);

@interface VBObserver : NSObject
@property (nonatomic, assign) NSUInteger state;
@property (nonatomic, strong) id         object;

- (instancetype)initWithState:(NSUInteger)state;

- (void)addHandler:(VBObserverHandler)handler forState:(NSUInteger)state object:(id)object;
- (void)removeHandlersForState:(NSUInteger)state;
- (void)removeHandlersForObject:(id)object;

- (void)setState:(NSUInteger)state withObject:(id)object;

@end
