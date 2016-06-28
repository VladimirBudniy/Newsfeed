//
//  UITableView+VBCategory.h
//  IOSProject
//
//  Created by Vladimir Budniy on 05.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (VBCategory)

- (UITableViewCell *)dequeueReusableCellWithClass:(Class)theClass;
- (id)dequeueReusableCellFromNibWithClass:(Class)theClass;
- (id)dequeueReusableCellWithBundleClass:(Class)theClass;

@end
