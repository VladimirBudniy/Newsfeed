//
//  VBViewController.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDPActiveRecordKit.h"

@interface VBViewController : UIViewController
@property (nonatomic, readonly) NSString * barTitle;
@property (nonatomic, readonly) NSString * leftButtonName;
@property (nonatomic, readonly) NSString * rightButtonName;

- (void)showNavigationBar;
- (void)hideNavigationBar;
@end
