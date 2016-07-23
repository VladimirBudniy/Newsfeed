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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Lang";
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
    UIViewController *viewController;
//
//    switch (indexPath.row) {
//        case 0:
//            viewController = [[VBFourthVC alloc] initWithNibName:@"VBFourthVC" bundle:nil];
//            break;
//            
//        case 1:
//            viewController = [[VBFifthVC alloc] initWithNibName:@"VBFifthVC" bundle:nil];
//            break;
//            
//    }
//    
    UINavigationController *controller = [[UINavigationController alloc]
                                          initWithRootViewController:viewController];
    [self openContentNavigationController:controller];
}

@end
