//
//  NSFileManager+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 19.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "NSFileManager+VBCategory.h"

@implementation NSFileManager (VBCategory)

+ (NSString *)directoryFolderPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [paths firstObject];
}

+ (NSString *)pathFileWithName:(NSString *)name {
    return [[NSFileManager directoryFolderPath] stringByAppendingPathComponent:name];
}

@end
