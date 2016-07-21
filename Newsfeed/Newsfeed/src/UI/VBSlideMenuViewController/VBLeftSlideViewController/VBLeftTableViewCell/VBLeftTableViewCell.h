//
//  VBLeftTableViewCell.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 21.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VBImageView;
@class VBNewsModel;

@interface VBLeftTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIView         *backgroundCellView;
@property (nonatomic, strong) IBOutlet UIView         *separatorCellView;
@property (nonatomic, strong) IBOutlet UILabel        *cellLabel;
@property (nonatomic, strong) IBOutlet UIImageView    *cellImage;

- (void)fillWithNews:(VBNewsModel *)newsModel;

@end
