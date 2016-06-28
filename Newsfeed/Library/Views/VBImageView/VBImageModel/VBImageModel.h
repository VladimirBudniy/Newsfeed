//
//  VBImageModel.h
//  IOSProject
//
//  Created by Vladimir Budniy on 25.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBModel.h"

@class VBObjectCache;

@interface VBImageModel : VBModel
@property (nonatomic, strong) UIImage     *image;
@property (nonatomic, strong) NSURL       *URL;

+ (instancetype)imageModelWithURL:(NSURL *)URL;

- (instancetype)initWithURL:(NSURL *)URL;

@end
