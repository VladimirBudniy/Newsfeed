//
//  VBModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 23.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBModel.h"

@implementation VBModel

#pragma mark -
#pragma mark Public

- (void)prepareToLoad {
    
}

- (void)completionLoad {
    [self finishLoad];
}

- (void)finishLoad {
    
}

- (void)setupLoad {
    
}

- (void)dump {
    
}

- (void)load {
    if (self.state == kVBModelLoadingState) {
        return;
    }
    
    if (self.state == kVBModelLoadedState) {
        [self completionLoad];
        return;
    }
    
    self.state = kVBModelLoadingState;
    
    [self setupLoad];
    
    VBWeakSelfMacro;
    VBDispatchAsyncInBackground(^{
        VBStrongSelfAndReturnNilMacro
        [strongSelf prepareToLoad];
        VBDispatchAsyncOnMainThread(^{
            [strongSelf finishLoad];
        });
    });
}

@end
