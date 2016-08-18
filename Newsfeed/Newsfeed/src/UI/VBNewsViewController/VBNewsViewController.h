//
//  VBNewsViewController.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBViewController.h"

@class VBNewsParser;

@interface VBNewsViewController : VBViewController <UITableViewDelegate>
@property (nonatomic, strong) VBNewsParser         *newsParser;
@property (nonatomic, strong) NSArray              *news;

@end
