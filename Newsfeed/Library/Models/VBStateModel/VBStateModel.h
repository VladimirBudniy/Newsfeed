//
//  VBStateModel.h
//  IOSProject
//
//  Created by Vladimir Budniy on 12.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, VBObjectState) {
    kVBObjectInserteState,
    kVBObjectRemoveState
};

@interface VBStateModel : NSObject
@property (nonatomic, assign) VBObjectState state;
@property (nonatomic, assign) NSUInteger    index;

+ (VBStateModel *)modelWithState:(VBObjectState)state index:(NSUInteger)index;

@end
