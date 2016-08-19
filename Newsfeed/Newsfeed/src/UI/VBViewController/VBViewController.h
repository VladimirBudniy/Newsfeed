//
//  VBViewController.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDPActiveRecordKit.h"
#import "VBMainSlideMenuViewController.h"

@interface VBViewController : UIViewController
@property (nonatomic, copy)     NSString *barTitle;
@property (nonatomic, readonly) NSString *leftButtonName;
@property (nonatomic, readonly) NSString *rightButtonName;

@property(nonatomic, strong) VBMainSlideMenuViewController *viewController;

- (void)showNavigationBar;
- (void)navigationBarColor:(UIColor *)color;

- (void)leftButtonWithImageName:(NSString *)name action:(SEL)selector target:(id)object;
- (void)rightButtonWithImageName:(NSString *)name action:(SEL)selector target:(id)object;

@end
