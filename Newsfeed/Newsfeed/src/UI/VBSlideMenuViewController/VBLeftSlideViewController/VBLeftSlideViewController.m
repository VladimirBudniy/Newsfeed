//
//  VBLeftSlideViewController.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 21.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBLeftSlideViewController.h"
#import "VBNewsViewController.h"
#import "VBLeftTableViewCell.h"
#import "VBNewsFeed.h"
#import "VBNewsModel.h"
#import "VBNewsParser.h"

static NSString * const kVBCategoriesStringName = @"Категорії новин";

@interface VBLeftSlideViewController ()
@property (nonatomic, strong) NSArray *categoryArray;

- (NSString *)categoryNameAtIndexPath:(NSIndexPath *)indexPath;
- (NSArray *)newsArrayWithCategory:(NSIndexPath *)indexPath;
- (NSArray *)newsForCategory:(kVBCategoryType)type;
- (VBNewsModel *)news:(VBNewsModel *)model category:(kVBCategoryType)type;

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
                           kVBInterestingCategoryName,
                           kVBHelpCategoryName];
}

#pragma mark
#pragma mark TableView Datasource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return kVBCategoriesStringName;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    view.tintColor = [UIColor whiteColor];
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:[UIColor darkGrayColor]];
    header.textLabel.font = [UIFont fontWithName:kVBBarTitleTextStyle size:kVBBarTitleTextSize];
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

    VBNewsViewController *viewController = [VBNewsViewController new];
    viewController.news = [self newsArrayWithCategory:indexPath];
    viewController.barTitle = [self categoryNameAtIndexPath:indexPath];
    UINavigationController *controller = [[UINavigationController alloc]
                                          initWithRootViewController:viewController];
    
    [self openContentNavigationController:controller];
}

#pragma mark -
#pragma mark Private

- (NSString *)categoryNameAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case kVBUkraineNewsCategory:
            return kVBUkraineNewsCategoryName;
            
        case kVBATOCategory:
            return kVBATOCategoryName;
            
        case kVCitymCategory:
            return kVCitymCategoryName;
            
        case kVBWorldNewsCategory:
            return kVBWorldNewsCategoryName;
            
        case kVBPoliticsCategory:
            return kVBPoliticsCategoryName;
            
        case kVBEconomicCategory:
            return kVBEconomicCategoryName;
            
        case kVBTechnologiesNewsCategory:
            return kVBTechnologiesNewsCategoryName;
            
        case kVBGlamourCategory:
            return kVBGlamourCategoryName;
            
        case kVBSportCategory:
            return kVBSportCategoryName;
            
        case kVBInterestingCategory:
           return kVBInterestingCategoryName;
            
        case kVBHelpCategory:
          return kVBHelpCategoryName;
    }
    
    return kVBAllNewsCategoryName;
}

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
