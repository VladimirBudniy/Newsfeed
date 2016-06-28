//
//  VBDispatch.m
//  C project
//
//  Created by Vladimir Budniy on 18.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBDispatch.h"

#pragma mark Private Declaration
dispatch_queue_t VBQueueWithPriority(VBDispatchPriorityType priority);

#pragma mark -
#pragma mark Private

dispatch_queue_t VBQueueWithPriority(VBDispatchPriorityType priority) {
    switch (priority) {
        case kVBDispatchPriorityHigh:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
            
        case kVBDispatchPriorityLow:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
            
        case kVBDispatchPriorityBackground:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
            
        case KVBDispatchPriorityDefault:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            
        case kVBDispatchPriorityMain:
            return dispatch_get_main_queue();
            
    }
}

#pragma mark -
#pragma mark Public

void VBDispatchAsyncWithPriority(VBDispatchPriorityType priority, VBDispatchHandler handler) {
    dispatch_async(VBQueueWithPriority(priority), handler);
}

void VBDispatchSyncWithPriority(VBDispatchPriorityType priority, VBDispatchHandler handler) {
    if ([NSThread mainThread]) {
        dispatch_async(VBQueueWithPriority(priority), handler);
    } else {
        dispatch_sync(VBQueueWithPriority(priority), handler);
    }
}

void VBDispatchAsyncInBackground(VBDispatchHandler handler) {
    VBDispatchAsyncWithPriority(kVBDispatchPriorityBackground, handler);
}

void VBDispatchAsyncOnMainThread(VBDispatchHandler handler) {
    VBDispatchAsyncWithPriority(kVBDispatchPriorityMain, handler);
}

void VBDispatchSyncInBackground(VBDispatchHandler handler) {
    VBDispatchSyncWithPriority(kVBDispatchPriorityBackground, handler);
}

void VBDispatchSyncOnMainThread(VBDispatchHandler handler) {
    VBDispatchSyncWithPriority(kVBDispatchPriorityMain, handler);
}


// for reference:

//dispatch_async(dispatch_queue_t queue, dispatch_block_t block);

//dispatch_sync(dispatch_queue_t queue, dispatch_block_t block);

//*  - DISPATCH_QUEUE_PRIORITY_HIGH:         QOS_CLASS_USER_INITIATED
//*  - DISPATCH_QUEUE_PRIORITY_DEFAULT:      QOS_CLASS_DEFAULT
//*  - DISPATCH_QUEUE_PRIORITY_LOW:          QOS_CLASS_UTILITY
//*  - DISPATCH_QUEUE_PRIORITY_BACKGROUND:   QOS_CLASS_BACKGROUND

