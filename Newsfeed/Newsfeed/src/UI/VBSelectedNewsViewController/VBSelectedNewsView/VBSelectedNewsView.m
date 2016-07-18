//
//  VBSelectedNewsView.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 02.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBSelectedNewsView.h"
#import "VBImageView.h"
#import "VBNewsModel.h"

@implementation VBSelectedNewsView

#pragma mark -
#pragma mark Public

- (void)fillWithNews:(VBNewsModel *)news {
    self.newsImage.URL = [NSURL URLWithString:news.urlString];
    self.newsTitle.text = news.title;
    self.newsDate.text = [NSDate stringFromDate:news.pubDate];
    self.newsText.text = news.fullText;
}

@end
