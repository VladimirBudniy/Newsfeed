//
//  VBHotNewsViewController.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBHotNewsViewController.h"
#import "VBSelectedNewsViewController.h"
#import "VBHotNewsView.h"
#import "VBNewsParser.h"
#import "VBTableViewCell.h"

static NSString * const kVBTsnRssUrlString    = @"http://tsn.ua/rss";
static NSString * const kVBNavigationItemText = @"Всі новини";

@interface VBHotNewsViewController ()
@property (nonatomic, readonly) VBHotNewsView  *rootView;
@property (nonatomic, strong)   NSMutableArray *newsArray;

@end

@implementation VBHotNewsViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBHotNewsView);

-(NSString *)barTitle {
    return kVBNavigationItemText;
}

- (void)setNewsArray:(NSMutableArray *)newsArray {
    if (_newsArray != newsArray) {
        _newsArray = newsArray;
        
        VBHotNewsView *rootView = self.rootView;
        [rootView removeLoadingViewAnimated:YES];
        [rootView.tableView reloadData];
    }
}

- (void)setNewsParser:(VBNewsParser *)newsParser {
    if (_newsParser != newsParser) {
        _newsParser = newsParser;
        
        if (_newsParser) {
            VBWeakSelfMacro;
            [_newsParser addHandler:^(VBNewsParser *parser) {
                VBStrongSelfAndReturnNilMacro;
                strongSelf.newsArray = [NSMutableArray arrayWithArray:parser.allNews];
            } forState:kVBModelLoadedState
                             object:self];   
        }

        [_newsParser load];
    }
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.newsParser = [[VBNewsParser alloc] initWithURL:[NSURL URLWithString:kVBTsnRssUrlString]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
}

#pragma mark -
#pragma mark TableView DataSource Protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VBTableViewCell *cell = [tableView dequeueReusableCellWithBundleClass:[VBTableViewCell class]];
    [cell fillWithNews:self.newsArray[indexPath.row]];
    
    return cell;
}

// cell's method for catches press
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    VBSelectedNewsViewController *controller = [VBSelectedNewsViewController new];
    controller.news = self.newsArray[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

////cell's method for adding and removing
//- (void)        tableView:(UITableView *)tableView
//       commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
//        forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    VBArrayModel *model = self.arrayModel;
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [model removeObjectAtIndex:indexPath.row];
//    } else {
//        [model insertObject:[VBStringModel new] atIndex:indexPath.row];
//    }
//}
//
//// cell's method for moving
//- (BOOL)            tableView:(UITableView *)tableView
//        canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//- (void)            tableView:(UITableView *)tableView
//           moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
//                  toIndexPath:(NSIndexPath *)toIndexPath
//{
//    [self.newsArray exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
//}
//
//#pragma mark -
//#pragma mark TableView Delegate Protocol
//
//// cell's method adding UITableViewCellEditingStyle
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
//           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.row < 1) {
//        return UITableViewCellEditingStyleInsert;
//    } else {
//        return UITableViewCellEditingStyleDelete;
//    }
//}



@end
