//
//  VBRightSlideViewController.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 21.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBRightSlideViewController.h"
#import "VBRightTableViewCell.h"

@interface VBRightSlideViewController ()

@end

@implementation VBRightSlideViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = [@[@"VC4", @"VC5"] mutableCopy];
}

#pragma mark
#pragma mark TableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Categories";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VBRightTableViewCell *cell = [tableView dequeueReusableCellWithBundleClass:[VBRightTableViewCell class]];
    cell.cellLabel.text = self.array[indexPath.row];
    
    return cell;
}

#pragma mark
#pragma mark TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UINavigationController *nvc;
    UIViewController *rootVC;
//
//    switch (indexPath.row) {
//        case 0:
//            rootVC = [[VBFourthVC alloc] initWithNibName:@"VBFourthVC" bundle:nil];
//            break;
//            
//        case 1:
//            rootVC = [[VBFifthVC alloc] initWithNibName:@"VBFifthVC" bundle:nil];
//            break;
//            
//    }
//    
    nvc = [[UINavigationController alloc] initWithRootViewController:rootVC];
    [self openContentNavigationController:nvc];
    
}

@end
