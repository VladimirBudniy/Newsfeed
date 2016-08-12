//
//  VBRightSlideViewController.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 21.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBRightSlideViewController.h"
#import "VBRightTableViewCell.h"
#import "VBNewsViewController.h"

static NSString * const kVBRightSlideControllerName = @"Мова";
static NSString * const kVBUkrLanguageStringName    = @"ukr";
static NSString * const kVBRusLanguageStringName    = @"rus";

@interface VBRightSlideViewController ()

@end

@implementation VBRightSlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.settingTableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.array = [@[kVBUkrLanguageStringName, kVBRusLanguageStringName] mutableCopy];
}

#pragma mark
#pragma mark TableView Datasource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return kVBRightSlideControllerName;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    view.tintColor = [UIColor whiteColor];
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:[UIColor darkGrayColor]];
    header.textLabel.font = [UIFont fontWithName:kVBBarTitleTextStyle size:kVBBarTitleTextSize];
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
    VBNewsViewController *viewController = [VBNewsViewController new];
    
//    switch (indexPath.row) {
//        case 0:
//
//            break;
//            
//    }

    UINavigationController *controller = [[UINavigationController alloc]
                                          initWithRootViewController:viewController];
    [self openContentNavigationController:controller];
}

@end
