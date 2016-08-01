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

static NSString * const kVBTsnRssUrlString    = @"http://tsn.ua/rss";

@interface VBHotNewsViewController ()
@property (nonatomic, readonly) VBHotNewsView    *rootView;
@property (nonatomic, strong)   NSMutableArray   *newsArray;
@property (nonatomic, strong)   UIRefreshControl *refreshControl;

- (void)parseXML;
- (void)addRefreshControl;
- (void)newsFeedWithArray:(NSArray *)array;
- (void)reloadRootViewData;
- (void)showSpinner;
- (VBNewsParser *)parser;

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
        
        [self newsFeedWithArray:_newsArray];
        [self reloadRootViewData];
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
    
    
    VBNewsFeed *newsFeed = [VBNewsFeed newsFeed];
    if (newsFeed.news.count) {
        [self showSpinner];
        self.newsArray = [NSMutableArray arrayWithArray:newsFeed.news];
    } else {
        self.newsParser = [self parser];
    }
    
    [self addRefreshControl];
}

#pragma mark -
#pragma mark Private

- (void)parseXML {
    [self showSpinner];
    if (!self.newsParser) {
        self.newsParser = [self parser];
    }
    
    self.newsParser.state = kVBModelDefaultState;
    [self.newsParser load];
}

- (void)addRefreshControl {
    UIRefreshControl *control = [[UIRefreshControl alloc] init];
    [control addTarget:self action:@selector(parseXML) forControlEvents:UIControlEventValueChanged];
    [self.rootView.tableView addSubview:control];
    self.refreshControl = control;
}

- (void)newsFeedWithArray:(NSArray *)array {
    VBNewsFeed *newsFeed = [VBNewsFeed newsFeed];
    [newsFeed removeNews];
    newsFeed.news = [NSArray arrayWithArray:array];
    [newsFeed saveManagedObject];
}

- (void)reloadRootViewData {
    VBHotNewsView *rootView = self.rootView;
    [rootView removeLoadingViewAnimated:YES];
    [rootView.tableView reloadData];
    [self.refreshControl endRefreshing];
}

- (VBNewsParser *)parser {
    return [[VBNewsParser alloc] initWithURL:[NSURL URLWithString:kVBTsnRssUrlString]];
}

- (void)showSpinner {
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

#pragma mark
#pragma mark TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    VBSelectedNewsViewController *controller = [VBSelectedNewsViewController new];
    controller.news = self.newsArray[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
