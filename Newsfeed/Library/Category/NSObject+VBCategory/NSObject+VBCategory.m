//
//  NSObject+VBCategory.m
//  C project
//
//  Created by Vladimir Budniy on 23.02.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "NSObject+VBCategory.h"

@implementation NSObject (VBCategory)

#pragma mark -
#pragma mark Initializations and Deallocatins

+ (instancetype)object {
    return [[[self class] alloc] init];
}

+ (NSArray *)objectsWithCount:(NSUInteger)count {
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSUInteger index = 0; index < count; index++) {
        id object = [self object];
        [array addObject:object];
    }
    
    return [array copy];
}

@end
