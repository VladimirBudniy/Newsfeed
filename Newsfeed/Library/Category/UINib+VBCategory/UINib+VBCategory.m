//
//  UINib+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 09.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "UINib+VBCategory.h"

@implementation UINib (VBCategory)

#pragma mark - 
#pragma mark Class Methods

+ (id)loadFromNibWithClass:(Class)theClass {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([theClass class]) bundle:[NSBundle mainBundle]];
    for (id object in [nib instantiateWithOwner:self options:nil]) {
        if ([object isMemberOfClass:[theClass class]]) {
            
            return object;
        }
    }
    
    return  nil;
}

@end