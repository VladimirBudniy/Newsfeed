//
//  VBLeftTableViewCell.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 21.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBLeftTableViewCell.h"
#import "VBImageView.h"
#import "VBNewsModel.h"

@implementation VBLeftTableViewCell

#pragma mark -
#pragma mark Public

- (void)fillWithNews:(VBNewsModel *)newsModel {
    self.cellLabel.text = newsModel.title;
}

@end
