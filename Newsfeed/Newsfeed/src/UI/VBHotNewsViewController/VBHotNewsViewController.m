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
@property (nonatomic, strong)   NSArray          *newsArray;
@property (nonatomic, strong)   UIRefreshControl *refreshControl;

- (void)loadNews;
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

- (void)setNewsArray:(NSArray *)newsArray {
    if (_newsArray != newsArray) {
        _newsArray = newsArray;

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
                NSArray *array = [NSArray arrayWithArray:parser.allNews];
                [strongSelf newsFeedWithArray:array];
                strongSelf.newsArray = array;
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

    [self loadNews];
    [self addRefreshControl];
}

#pragma mark -
#pragma mark Private

- (void)loadNews {
    NSArray *array = [NSArray arrayWithArray:self.news];
    if (array.count) {
        [self showSpinner];
        self.newsArray = [NSArray arrayWithArray:array];
    } else {
        self.newsParser = [self parser];
    }
}

- (void)parseXML {
    [self showSpinner];
    if (!self.newsParser) {
        self.newsParser = [self parser];
    }
    
    self.navigationItem.title = kVBAllNewsCategoryName;
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
    [self.rootView showLoadingViewAnimated:YES];
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
