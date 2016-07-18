//
//  VBSelectedNewsView.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 02.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBViewModel.h"

@class VBImageView;
@class VBNewsModel;

@interface VBSelectedNewsView : VBViewModel

@property (nonatomic, strong) IBOutlet VBImageView *newsImage;
@property (nonatomic, strong) IBOutlet UILabel     *newsTitle;
@property (nonatomic, strong) IBOutlet UILabel     *newsDate;
@property (nonatomic, strong) IBOutlet UITextView  *newsText;

- (void)fillWithNews:(VBNewsModel *)news;

@end
