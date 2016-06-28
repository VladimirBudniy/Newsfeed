//
//  VBObjectCache.h
//  IOSProject
//
//  Created by Vladimir Budniy on 31.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBObjectCache : NSObject <NSCoding>

+ (instancetype)sharedObject;

- (void)setObject:(id)object forKey:(id)key;
- (void)removeObjectForKey:(id)key;

- (BOOL)isCachedWithKey:(id)key;
- (id)objectForKey:(id)key;
- (id)keyForObject:(id)object;

@end
