//
//  VBViewModel.h
//  IOSProject
//
//  Created by Vladimir Budniy on 18.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBViewModel : UIView

- (void)showLoadingView;

- (void)showLoadingViewWithDefaultText;
- (void)showLoadingViewWithDefaultTextAnimated:(BOOL)animated;

- (void)showLoadingViewWithText:(NSString *)text;
- (void)showLoadingViewWithText:(NSString *)text animated:(BOOL)animated;

- (void)removeLoadingView;
- (void)removeLoadingViewAnimated:(BOOL)animated;

@end
