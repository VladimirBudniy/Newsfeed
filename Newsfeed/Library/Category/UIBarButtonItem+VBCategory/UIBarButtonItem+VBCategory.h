//
//  UIBarButtonItem+VBCategory.h
//  FBNewProject
//
//  Created by Vladimir Budniy on 13.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (VBCategory)

+ (UIBarButtonItem *)leftButtonWithImage:image action:(SEL)action target:(id)target;
+ (UIBarButtonItem *)rightButtonWithImage:image action:(SEL)action target:(id)target;

@end
