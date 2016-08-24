//
//  VBHotNewsTableViewCell.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 24.08.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBHotNewsTableViewCell.h"
#import "VBImageView.h"
#import "VBNewsModel.h"

@implementation VBHotNewsTableViewCell

#pragma mark -
#pragma mark Public

- (void)fillWithNews:(VBNewsModel *)newsModel {
    self.cellLabel.text = newsModel.title;
    self.cellImage.URL = [NSURL URLWithString:[newsModel urlString]];
    self.cellDateLabel.text = [NSDate stringFromDate:newsModel.pubDate];
}

@end
