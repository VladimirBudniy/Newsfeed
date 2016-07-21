//
//  VBRightTableViewCell.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 21.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBRightTableViewCell.h"
#import "VBImageView.h"
#import "VBNewsModel.h"

@implementation VBRightTableViewCell

#pragma mark -
#pragma mark Public

- (void)fillWithNews:(VBNewsModel *)newsModel {
    self.cellLabel.text = newsModel.title;
}

@end
