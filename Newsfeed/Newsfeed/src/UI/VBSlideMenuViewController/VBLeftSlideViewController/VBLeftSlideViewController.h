//
//  VBLeftSlideViewController.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 21.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "AMSlideMenuLeftTableViewController.h"

@interface VBLeftSlideViewController : AMSlideMenuLeftTableViewController <UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView *menuTableView;
@property (nonatomic, strong) NSMutableArray       *array;

@end
