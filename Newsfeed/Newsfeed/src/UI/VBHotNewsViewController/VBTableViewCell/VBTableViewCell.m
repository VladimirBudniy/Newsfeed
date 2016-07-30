//
//  VBTableViewCell.m
//  IOSProject
//
//  Created by Vladimir Budniy on 05.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBTableViewCell.h"
#import "VBImageView.h"
#import "VBNewsModel.h"

@implementation VBTableViewCell

#pragma mark -
#pragma mark Public

- (void)fillWithNews:(VBNewsModel *)newsModel {
    self.cellLabel.text = newsModel.title;
    self.cellImage.URL = [NSURL URLWithString:[newsModel urlString]];
    self.cellDateLabel.text = [NSDate convertStringDate:newsModel.pubDate];
}

@end
