//
//  VBLeftSlideViewController.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 21.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBLeftSlideViewController.h"
#import "VBHotNewsViewController.h"
#import "VBLeftTableViewCell.h"
#import "VBNewsParser.h"
#import "VBConstants.h"

static NSString * const kVBCategoriesStringName = @"Categories";

@interface VBLeftSlideViewController ()
@property (nonatomic, strong) NSArray *categoryArray;

@end

@implementation VBLeftSlideViewController

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.categoryArray = @[kVBAllNewsCategoryName,
                            kVBUkraineNewsCategoryName,
                            kVBATOCategoryName,
                            kVCitymCategoryName,
                            kVBWorldNewsCategoryName,
                            kVBPoliticsCategoryName,
                            kVBEconomicCategoryName,
                            kVBTechnologiesNewsCategoryName,
                            kVBGlamourCategoryName,
                            kVBSportCategoryName,
                            kVBTourismCategoryName,
                            kVBInterestingCategoryName];
}

#pragma mark
#pragma mark TableView Datasource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return kVBCategoriesStringName;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categoryArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VBLeftTableViewCell *cell = [tableView dequeueReusableCellWithBundleClass:[VBLeftTableViewCell class]];
    cell.cellLabel.text = self.categoryArray[indexPath.row];
    
    return cell;
}

#pragma mark
#pragma mark TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UIViewController *viewController;

    switch (indexPath.row) {
        case kVBAllNewsCategory:
            viewController = [VBHotNewsViewController new];
            break;
            
        case kVBUkraineNewsCategory:
            viewController = [VBHotNewsViewController new];
            break;
            
        case kVBATOCategory:
            viewController = [VBHotNewsViewController new];
            break;
            
        case kVCitymCategory:
            viewController = [VBHotNewsViewController new];
            break;
            
        case kVBWorldNewsCategory:
            viewController = [VBHotNewsViewController new];
            break;
            
        case kVBPoliticsCategory:
            viewController = [VBHotNewsViewController new];
            break;
            
        case kVBEconomicCategory:
            viewController = [VBHotNewsViewController new];
            break;
            
        case kVBTechnologiesNewsCategory:
            viewController = [VBHotNewsViewController new];
            break;
            
        case kVBGlamourCategory:
            viewController = [VBHotNewsViewController new];
            break;
            
        case kVBSportCategory:
            viewController = [VBHotNewsViewController new];
            break;
            
        case kVBTourismCategory:
            viewController = [VBHotNewsViewController new];
            break;
            
        case kVBInterestingCategory:
            viewController = [VBHotNewsViewController new];
            break;
    }
    
    UINavigationController *controller = [[UINavigationController alloc]
                                          initWithRootViewController:viewController];
    [self openContentNavigationController:controller];
}

@end
