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
#import "VBNewsFeed.h"
#import "VBNewsModel.h"
#import "VBNewsParser.h"

static NSString * const kVBCategoriesStringName = @"Categories";

@interface VBLeftSlideViewController ()
@property (nonatomic, strong) NSArray *categoryArray;

//- (VBHotNewsViewController *)controllerFromIndexPath:(NSIndexPath *)indexPath;
//- (VBHotNewsViewController *)controllerWithCategory:(kVBCategoryType)type;
- (NSArray *)newsArrayWithCategory:(NSIndexPath *)indexPath;
- (NSArray *)newsForCategory:(kVBCategoryType)type;

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
                           kVBInterestingCategoryName,
                           kVBHelpCategoryName];
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
    
//    VBHotNewsViewController *viewController = [self controllerFromIndexPath:indexPath];

    VBHotNewsViewController *viewController = [VBHotNewsViewController new];
    viewController.newsArray = [self newsArrayWithCategory:indexPath];
    
    UINavigationController *controller = [[UINavigationController alloc]
                                          initWithRootViewController:viewController];
    
    [self openContentNavigationController:controller];
}

#pragma mark -
#pragma mark Private

//- (VBHotNewsViewController *)controllerFromIndexPath:(NSIndexPath *)indexPath {
//    VBHotNewsViewController *viewController;
//    
//    switch (indexPath.row) {
//        case kVBAllNewsCategory:
//            viewController = [self controllerWithCategory:kVBAllNewsCategory];
//            break;
//            
//        case kVBUkraineNewsCategory:
//            viewController = [self controllerWithCategory:kVBUkraineNewsCategory];
//            break;
//            
//        case kVBATOCategory:
//            viewController = [self controllerWithCategory:kVBATOCategory];
//            
//            break;
//            
//        case kVCitymCategory:
//            viewController = [self controllerWithCategory:kVCitymCategory];
//            
//            break;
//            
//        case kVBWorldNewsCategory:
//            viewController = [self controllerWithCategory:kVBWorldNewsCategory];
//            
//            break;
//            
//        case kVBPoliticsCategory:
//            viewController = [self controllerWithCategory:kVBPoliticsCategory];
//            
//            break;
//            
//        case kVBEconomicCategory:
//            viewController = [self controllerWithCategory:kVBEconomicCategory];
//            break;
//            
//        case kVBTechnologiesNewsCategory:
//            viewController = [self controllerWithCategory:kVBTechnologiesNewsCategory];
//            break;
//            
//        case kVBGlamourCategory:
//            viewController = [self controllerWithCategory:kVBGlamourCategory];
//            break;
//            
//        case kVBSportCategory:
//            viewController = [self controllerWithCategory:kVBSportCategory];
//            break;
//            
//        case kVBTourismCategory:
//            viewController = [self controllerWithCategory:kVBTourismCategory];
//            break;
//            
//        case kVBInterestingCategory:
//            viewController = [self controllerWithCategory:kVBInterestingCategory];
//            break;
//            
//        case kVBHelpCategory:
//            viewController = [self controllerWithCategory:kVBHelpCategory];
//            break;
//    }
//    
//    return viewController;
//}

//- (VBHotNewsViewController *)controllerWithCategory:(kVBCategoryType)type {
//    VBHotNewsViewController *viewController = [VBHotNewsViewController new];
//    viewController.newsArray = [self newsArrayWithCategory:type];
//    
//    return viewController;
//}

- (NSArray *)newsArrayWithCategory:(NSIndexPath *)indexPath {
    NSMutableArray *array = [NSMutableArray array];
    
    switch (indexPath.row) {
        case kVBAllNewsCategory:
            [array addObjectsFromArray:[self newsForCategory:kVBAllNewsCategory]];
            break;
            
        case kVBUkraineNewsCategory:
            [array addObjectsFromArray:[self newsForCategory:kVBUkraineNewsCategory]];
            break;
            
        case kVBATOCategory:
            [array addObjectsFromArray:[self newsForCategory:kVBATOCategory]];
            break;
            
        case kVCitymCategory:
            [array addObjectsFromArray:[self newsForCategory:kVCitymCategory]];
            break;
            
        case kVBWorldNewsCategory:
            [array addObjectsFromArray:[self newsForCategory:kVBWorldNewsCategory]];
            break;
            
        case kVBPoliticsCategory:
            [array addObjectsFromArray:[self newsForCategory:kVBPoliticsCategory]];
            break;
            
        case kVBEconomicCategory:
            [array addObjectsFromArray:[self newsForCategory:kVBEconomicCategory]];
            break;
            
        case kVBTechnologiesNewsCategory:
            [array addObjectsFromArray:[self newsForCategory:kVBTechnologiesNewsCategory]];
            break;
            
        case kVBGlamourCategory:
            [array addObjectsFromArray:[self newsForCategory:kVBGlamourCategory]];
            break;
            
        case kVBSportCategory:
            [array addObjectsFromArray:[self newsForCategory:kVBSportCategory]];
            break;
            
        case kVBTourismCategory:
            [array addObjectsFromArray:[self newsForCategory:kVBTourismCategory]];
            break;
            
        case kVBInterestingCategory:
            [array addObjectsFromArray:[self newsForCategory:kVBInterestingCategory]];
            break;
            
        case kVBHelpCategory:
            [array addObjectsFromArray:[self newsForCategory:kVBHelpCategory]];
            break;
    }
    
    
    return array;
}

- (NSArray *)newsForCategory:(kVBCategoryType)type {
    NSMutableArray *array = [NSMutableArray array];
    VBNewsFeed *newsFeed = [VBNewsFeed newsFeed];
    for (VBNewsModel *newsModel in newsFeed.news) {
        VBNewsModel *model = [self news:newsModel category:type];
        if (model) {
            [array addObject:model];
        }
    }
    
    return array;
}

- (VBNewsModel *)news:(VBNewsModel *)model category:(kVBCategoryType)type {
    NSString *string = model.newsCategory;
    
    switch (type) {
        case kVBAllNewsCategory:
            return model;
            break;
            
        case kVBUkraineNewsCategory:
            if ([string isEqualToString:kVBUkraineNewsOriginalCategoryName]) {
                return model;
            } else {
                break;
            }
            
        case kVBATOCategory:
            if ([string isEqualToString:kVBATOOriginalCategoryName]) {
                return model;
            } else {
                break;
            }
            
        case kVCitymCategory:
            if ([string isEqualToString:kVCitymOriginalCategoryName]) {
                return model;
            } else {
                break;
            }
            
        case kVBWorldNewsCategory:
            if ([string isEqualToString:kVBWorldNewsOriginalCategoryName]) {
                return model;
            } else {
                break;
            }
            
        case kVBPoliticsCategory:
            if ([string isEqualToString:kVBPoliticsOriginalCategoryName]) {
                return model;
            } else {
                break;
            }
            
        case kVBEconomicCategory:
            if ([string isEqualToString:kVBEconomicOriginalCategoryName]) {
                return model;
            } else {
                break;
            }
            
        case kVBTechnologiesNewsCategory:
            if ([string isEqualToString:kVBTechnologiesOriginalNewsCategoryName]) {
                return model;
            } else {
                break;
            }
            
        case kVBGlamourCategory:
            if ([string isEqualToString:kVBGlamourOriginalCategoryName]) {
                return model;
            } else {
                break;
            }
            
        case kVBSportCategory:
            if ([string isEqualToString:kVBSportOriginalCategoryName]) {
                return model;
            } else {
                break;
            }
            
        case kVBTourismCategory:
            if ([string isEqualToString:kVBTourismOriginalCategoryName]) {
                return model;
            } else {
                break;
            }
            
        case kVBInterestingCategory:
            if ([string isEqualToString:kVBInterestingOriginalCategoryName]) {
                return model;
            } else {
                break;
            }
            
        case kVBHelpCategory:
            if ([string isEqualToString:kVBHelpOriginalCategoryName]) {
                return model;
            } else {
                break;
            }
    }
    
    return nil;
}

@end
