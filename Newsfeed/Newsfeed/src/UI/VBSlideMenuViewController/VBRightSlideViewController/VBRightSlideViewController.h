//
//  VBRightSlideViewController.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 21.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "AMSlideMenuRightTableViewController.h"

@interface VBRightSlideViewController : AMSlideMenuRightTableViewController <UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView *settingTableView;
@property (nonatomic, strong) NSMutableArray       *array;

@end
