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
@property (nonatomic, readonly) VBHotNewsView    *rootView;
@property (nonatomic, strong)   NSMutableArray   *newsArray;
@property (nonatomic, strong)   UIRefreshControl *refreshControl;

- (void)parseXML;
- (void)addRefreshControl;

@end

@implementation VBHotNewsViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBHotNewsView);

-(NSString *)barTitle {
    return kVBNavigationItemText;
}

- (NSString *)leftButtonName {
    return nil;
}

- (void)setNewsArray:(NSMutableArray *)newsArray {
    if (_newsArray != newsArray) {
        _newsArray = newsArray;
        
        VBHotNewsView *rootView = self.rootView;
        [rootView removeLoadingViewAnimated:YES];
        [rootView.tableView reloadData];
        [self.refreshControl endRefreshing];
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
        
        [self parseXML];
    }
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.newsParser = [[VBNewsParser alloc] initWithURL:[NSURL URLWithString:kVBTsnRssUrlString]];
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
    [self addRefreshControl];
}

#pragma mark -
#pragma mark View Private

- (void)parseXML {
    self.newsParser.state = kVBModelDefaultState;
    [self.newsParser load];
}

- (void)addRefreshControl {
    UIRefreshControl *control = [[UIRefreshControl alloc] init];
    [control addTarget:self action:@selector(parseXML) forControlEvents:UIControlEventValueChanged];
    [self.rootView.tableView addSubview:control];
    self.refreshControl = control;
}

#pragma mark -
#pragma mark TableView DataSource Protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    VBTableViewCell *cell = [tableView dequeueReusableCellWithBundleClass:[VBTableViewCell class]];
//    CGFloat cellHeigh = cell.frame.size.height;
//    CGFloat rootViewHeigh = self.rootView.frame.size.height;
//    
//    NSUInteger count = rootViewHeigh / cellHeigh;
//    
//    return count;
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
////////////////////
- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    tableView insertRowsAtIndexPaths:<#(nonnull NSArray<NSIndexPath *> *)#> withRowAnimation:<#(UITableViewRowAnimation)#>
    // вызывается при появлении следующей ячейки, если она есть......
}

//- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath {
//    // вызывается когда долистали таблицу до конца......
//}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
////cell's method for adding and removing
//- (void)        tableView:(UITableView *)tableView
//       commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
//        forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSMutableArray *model = self.newsArray;
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [model removeObjectAtIndex:indexPath.row];
//    }
////    else {
////        [model insertObject:[VBStringModel new] atIndex:indexPath.row];
////    }
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
