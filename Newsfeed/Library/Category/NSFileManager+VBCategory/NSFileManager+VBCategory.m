//
//  NSFileManager+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 19.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "NSFileManager+VBCategory.h"

@implementation NSFileManager (VBCategory)

#pragma mark -
#pragma mark Class Methods

+ (NSString *)directoryFolderPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [paths firstObject];
}

+ (NSString *)pathFileWithName:(NSString *)name {
    return [[NSFileManager directoryFolderPath] stringByAppendingPathComponent:name];
}

+ (NSString *)pathPhotoWithName:(NSString *)name folder:(NSString *)folder {
    return [[NSFileManager pathFolderWithName:folder] stringByAppendingPathComponent:name];
}

+ (NSString *)pathFolderWithName:(NSString *)name {
    [NSFileManager createFolderWithName:name];
    
    return [[NSFileManager directoryFolderPath] stringByAppendingPathComponent:name];
}

+ (void)createFolderWithName:(NSString *)name {
    NSString *dataPath = [[NSFileManager directoryFolderPath] stringByAppendingPathComponent:name];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath
                                  withIntermediateDirectories:NO
                                                   attributes:nil
                                                        error:nil];
    }
}

+ (BOOL)removeFileWithName:(NSString *)name {
    NSString *path = [NSFileManager pathFolderWithName:name];
    
    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

@end
