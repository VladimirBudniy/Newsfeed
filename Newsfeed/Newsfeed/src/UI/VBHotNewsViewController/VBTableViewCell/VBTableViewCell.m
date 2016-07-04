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

static NSString * const kVBCellDateTextFormat = @"MMM d, H:mm";
static NSString * const kVBLocaleIdentifier   = @"uk_BI";
static NSUInteger const kVBSecondsFromGMT     = 0;

@implementation VBTableViewCell

#pragma mark -
#pragma mark Public

- (void)fillWithNews:(VBNewsModel *)newsModel {
    self.cellLabel.text = newsModel.title;
    self.cellImage.URL = [NSURL URLWithString:newsModel.urlString];
    
    NSString *stringDate = [NSDate stringFromDate:newsModel.pubDate
                                            localeIdentifier:kVBLocaleIdentifier
                                             dateFormate:kVBCellDateTextFormat
                                          secondsFromGMT:kVBSecondsFromGMT];
    
    self.cellDateLabel.text = stringDate;
}

@end
