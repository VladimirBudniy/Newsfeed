//
//  VBObserverArray.h
//  C project
//
//  Created by Vladimir Budniy on 12.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^VBObserverHandler)(id object);

@interface VBObserverArray : NSObject
@property (nonatomic, readonly) NSArray *handlers;

- (void)addHandler:(VBObserverHandler)handler forObject:(id)object;
- (void)removeHandlersForObject:(id)object;

@end
