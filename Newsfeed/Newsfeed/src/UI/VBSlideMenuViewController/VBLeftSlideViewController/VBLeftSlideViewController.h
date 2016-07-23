//
//  VBLeftSlideViewController.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 21.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "AMSlideMenuLeftTableViewController.h"

@class VBNewsParser;

@interface VBLeftSlideViewController : AMSlideMenuLeftTableViewController <UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView *menuTableView;

@end
