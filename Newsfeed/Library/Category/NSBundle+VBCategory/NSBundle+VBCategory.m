//
//  NSBundle+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 16.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "NSBundle+VBCategory.h"

@implementation NSBundle (VBCategory)

#pragma mark -
#pragma mark Class Methods

+ (id)objectFromBundleWithClass:(Class)theClass {
    NSBundle *bundle = [NSBundle mainBundle];
    for (id object in [bundle loadNibNamed:NSStringFromClass([theClass class]) owner:self options:nil]) {
        if ([object isMemberOfClass:[theClass class]]) {
            
            return object;
        }
    }
    
    return  nil;
}

+ (NSString *)pathForFileWithName:(NSString *)name {
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:name];
}

@end
