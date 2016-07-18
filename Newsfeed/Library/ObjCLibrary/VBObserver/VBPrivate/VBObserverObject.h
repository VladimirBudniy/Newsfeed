//
//  VBObserverObject.h
//  C project
//
//  Created by Vladimir Budniy on 12.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^VBObserverHandler)(id object);

@interface VBObserverObject : NSObject
@property (nonatomic, weak) id                object;
@property (nonatomic, copy) VBObserverHandler handler;

+ (VBObserverObject *)objectWithObject:(id)object handler:(VBObserverHandler)handler;

- (instancetype)initWithObject:(id)object handler:(VBObserverHandler)handler;

@end
