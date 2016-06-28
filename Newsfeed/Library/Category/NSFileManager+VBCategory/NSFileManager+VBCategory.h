//
//  NSFileManager+VBCategory.h
//  IOSProject
//
//  Created by Vladimir Budniy on 19.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (VBCategory)
+ (NSString *)directoryFolderPath;
+ (NSString *)pathFileWithName:(NSString *)name;

@end
