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

@implementation VBTableViewCell

#pragma mark -
#pragma mark Public

- (void)fillWithNews:(VBNewsModel *)newsModel {
    self.cellLabel.text = newsModel.title;
    self.cellImage.URL = [NSURL URLWithString:newsModel.urlString];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"uk_BI"];
    [formatter setLocale:locale];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [formatter setDateFormat:kVBCellDateTextFormat];
    NSString *currentStringDate = [formatter stringFromDate:newsModel.pubDate];
    
    self.cellDateLabel.text = currentStringDate;
}

@end
