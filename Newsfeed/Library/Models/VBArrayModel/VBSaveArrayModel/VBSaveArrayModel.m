//
//  VBSaveArrayModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 22.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBSaveArrayModel.h"
#import "VBArrayModel.h"

static NSString * const kVBFileAdress       = @"tmp.plist";

@interface VBSaveArrayModel ()
@property (nonatomic, readonly)                  NSString        *path;
@property (nonatomic, readonly, getter=isCached) BOOL            cached;

@property (nonatomic, readonly) NSArray *keys;

+ (instancetype)model;

- (void)save;
- (void)addObserversWithKeys:(NSArray *)keys;
- (void)removeObserversWithKeys:(NSArray *)keys;

@end

@implementation VBSaveArrayModel

@dynamic keys;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)model {
    VBSaveArrayModel *model = [VBSaveArrayModel new];
    if (model.isCached) {
        return [NSKeyedUnarchiver unarchiveObjectWithFile:model.path];
    } else {
        return [VBSaveArrayModel new];
    }
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    [self removeObserversWithKeys:self.keys];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addObserversWithKeys:self.keys];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)keys {
    return @[UIApplicationDidEnterBackgroundNotification, UIApplicationWillTerminateNotification];
}

- (NSString *)path {
    return [NSFileManager pathFileWithName:kVBFileAdress];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}

#pragma mark -
#pragma mark Private

- (void)addObserversWithKeys:(NSArray *)keys {
    for (NSString *key in self.keys) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(save)
                                                     name:key
                                                   object:nil];
    }
}

- (void)removeObserversWithKeys:(NSArray *)keys {
    for (NSString *key in self.keys) {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:key
                                                      object:nil];
    }
}

- (void)save {
    [NSKeyedArchiver archiveRootObject:self toFile:self.path];
}

#pragma mark -
#pragma mark Public

- (void)finishLoad {
    self.state = kVBModelLoadedState;
}

- (void)prepareToLoad {
    VBSaveArrayModel *model = [VBSaveArrayModel model];
    [self addObjects:model.objects];
}

@end
