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
#import "VBNewsFeed.h"
#import "VBNewsParser.h"
#import "VBTableViewCell.h"
#import "VBConstants.h"

static NSString * const kVBTsnRssUrlString    = @"http://tsn.ua/rss";

@interface VBHotNewsViewController ()
@property (nonatomic, readonly) VBHotNewsView    *rootView;
@property (nonatomic, strong)   VBNewsFeed       *newsFeed;
@property (nonatomic, strong)   NSMutableArray   *newsArray;
@property (nonatomic, strong)   UIRefreshControl *refreshControl;

- (void)parseXML;
- (void)addRefreshControl;
//- (void)cleanDatabase;

@end

@implementation VBHotNewsViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBHotNewsView);

-(NSString *)barTitle {
    return kVBAllNewsCategoryName;
}

- (void)setNewsArray:(NSMutableArray *)newsArray {
    if (_newsArray != newsArray) {
        _newsArray = newsArray;
        
        VBNewsFeed *newsFeed = [VBNewsFeed newsFeed];
        newsFeed.news = [NSArray arrayWithArray:_newsArray];
        [newsFeed saveManagedObject];
        
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
//                [strongSelf cleanDatabase];
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
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
    
    VBNewsFeed *newsFeed = [VBNewsFeed newsFeed];
    if (newsFeed.news.count) {
        self.newsArray = [NSMutableArray arrayWithArray:newsFeed.news];
    } else {
        self.newsParser = [[VBNewsParser alloc] initWithURL:[NSURL URLWithString:kVBTsnRssUrlString]]; //duplicated
    }
    
    [self addRefreshControl];
}

#pragma mark -
#pragma mark Private

- (void)parseXML {
    if (!self.newsParser) {
        self.newsParser = [[VBNewsParser alloc] initWithURL:[NSURL URLWithString:kVBTsnRssUrlString]]; //duplicated
    }
    
    self.newsParser.state = kVBModelDefaultState;
    [self.newsParser load];
}

//- (void)cleanDatabase {
//    BOOL success = [[NSFileManager defaultManager] removeItemAtPath:[NSFileManager photosFolderPath]
//                                                              error:nil];
//    if (success) {
//        [[VBNewsFeed newsFeed] removeNews];
//    }
//}

- (void)addRefreshControl {
    UIRefreshControl *control = [[UIRefreshControl alloc] init];
    [control addTarget:self action:@selector(parseXML) forControlEvents:UIControlEventValueChanged];
    [self.rootView.tableView addSubview:control];
    self.refreshControl = control;
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

#pragma mark
#pragma mark TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    VBSelectedNewsViewController *controller = [VBSelectedNewsViewController new];
    controller.news = self.newsArray[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
