//
//  NSBundle+VBCategory.h
//  IOSProject
//
//  Created by Vladimir Budniy on 16.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (VBCategory)

+ (id)objectFromBundleWithClass:(Class)theClass;
+ (NSString *)pathForFileWithName:(NSString *)name;

@end
