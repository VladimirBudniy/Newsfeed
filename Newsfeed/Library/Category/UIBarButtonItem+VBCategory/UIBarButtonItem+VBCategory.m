//
//  UIBarButtonItem+VBCategory.m
//  FBNewProject
//
//  Created by Vladimir Budniy on 13.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "UIBarButtonItem+VBCategory.h"

@implementation UIBarButtonItem (VBCategory)

+ (UIBarButtonItem *)leftButtonWithImage:image action:(SEL)action target:(id)target; {
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:image
                                                               style:UIBarButtonItemStylePlain
                                                              target:target
                                                              action:action];
   
    return  button;
}

+ (UIBarButtonItem *)rightButtonWithImage:image action:(SEL)action target:(id)target {
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:image
                                                               style:UIBarButtonItemStylePlain
                                                              target:target
                                                              action:action];
    
    return  button;
}

@end
