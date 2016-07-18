//
//  VBModel.h
//  IOSProject
//
//  Created by Vladimir Budniy on 23.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserver.h"

typedef NS_ENUM(NSUInteger, VBModelState) {
    kVBModelUndefinedState,
    kVBModelDefaultState,
    kVBModelLoadingState,
    kVBModelChangeState,
    kVBModelLoadedState,
    kVBModelFailedState
};

@interface VBModel : VBObserver

- (void)load;
- (void)dump;

- (void)setupLoad;
- (void)prepareToLoad;
- (void)completionLoad;
- (void)finishLoad;

@end
