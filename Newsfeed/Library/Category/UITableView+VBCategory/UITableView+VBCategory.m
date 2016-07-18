//
//  UITableView+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 05.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "UITableView+VBCategory.h"

@implementation UITableView (VBCategory)

#pragma mark -
#pragma mark Public

- (UITableViewCell *)dequeueReusableCellWithClass:(Class)theClass {
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass([theClass class])];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:NSStringFromClass([theClass class])];
    }
    
    return cell;
}

- (id)dequeueReusableCellFromNibWithClass:(Class)theClass {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass([theClass class])];
    if (!cell) {
        cell = [UINib loadFromNibWithClass:[theClass class]];
    }
    
    return cell;
}

- (id)dequeueReusableCellWithBundleClass:(Class)theClass {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass([theClass class])];
    if (!cell) {
        cell = [NSBundle objectFromBundleWithClass:[theClass class]];
    }
    
    return cell;
}

@end
