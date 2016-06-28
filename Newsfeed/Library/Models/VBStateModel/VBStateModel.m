//
//  VBStateModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 12.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBStateModel.h"

@implementation VBStateModel

#pragma mark -
#pragma mark Class Methods

+ (VBStateModel *)modelWithState:(VBObjectState)state index:(NSUInteger)index {
    VBStateModel *model = [VBStateModel new];
    model.state = state;
    model.index = index;
    
    return model;
}

@end
