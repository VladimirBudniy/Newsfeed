//
//  VBHotNewsView.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBViewModel.h"
#import "VBLoadingView.h"

@interface VBHotNewsView : VBViewModel
@property (nonatomic, strong) IBOutlet UITableView  *tableView;

@end
