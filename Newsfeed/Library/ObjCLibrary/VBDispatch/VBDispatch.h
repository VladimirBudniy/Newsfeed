//
//  VBDispatch.h
//  C project
//
//  Created by Vladimir Budniy on 18.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^VBDispatchHandler)(void);

typedef enum {
    kVBDispatchPriorityHigh,
    kVBDispatchPriorityLow,
    kVBDispatchPriorityBackground,
    KVBDispatchPriorityDefault,
    kVBDispatchPriorityMain,
} VBDispatchPriorityType;

extern
void VBDispatchAsyncWithPriority(VBDispatchPriorityType priority, VBDispatchHandler handler);
extern
void VBDispatchSyncWithPriority(VBDispatchPriorityType priority, VBDispatchHandler handler);

extern
void VBDispatchAsyncInBackground(VBDispatchHandler handler);
extern
void VBDispatchAsyncOnMainThread(VBDispatchHandler handler);

extern
void VBDispatchSyncInBackground(VBDispatchHandler handler);
extern
void VBDispatchSyncOnMainThread(VBDispatchHandler handler);


