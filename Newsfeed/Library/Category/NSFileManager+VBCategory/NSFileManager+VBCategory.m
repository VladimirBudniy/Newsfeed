//
//  NSFileManager+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 19.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "NSFileManager+VBCategory.h"

static NSString * const kVBPhotosFolderName = @"/Photos";

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

+ (NSString *)pathPhotoWithName:(NSString *)name {
    return [[NSFileManager photosFolderPath] stringByAppendingPathComponent:name];
}

+ (NSString *)photosFolderPath {
    [NSFileManager createFolderWithName:kVBPhotosFolderName];

    return [[NSFileManager directoryFolderPath] stringByAppendingPathComponent:kVBPhotosFolderName];
}

+ (void)createFolderWithName:(NSString *)name {
    NSString *dataPath = [[NSFileManager directoryFolderPath] stringByAppendingPathComponent:name];
    NSError *saveError = nil;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath
                                  withIntermediateDirectories:NO
                                                   attributes:nil
                                                        error:&saveError];
    }
}

@end
