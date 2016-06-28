//
//  VBImageModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 25.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBImageModel.h"
#import "VBObjectCache.h"

@interface VBImageModel ()
@property (nonatomic, readonly, getter=isCached) BOOL       cached;
@property (nonatomic, readonly)                  NSString   *path;
@property (nonatomic, readonly)                  NSString   *fileName;

@property (nonatomic, strong) NSURLSession              *session;
@property (nonatomic, strong) NSURLSessionDownloadTask  *task;

@property (nonatomic, readonly) VBObjectCache *cache;

- (void)removeIfNeeded;
- (void)loadFromFile;
- (void)download;

@end

@implementation VBImageModel

@dynamic cached;
@dynamic path;
@dynamic cache;
@dynamic fileName;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageModelWithURL:(NSURL *)URL {
    return [[self alloc] initWithURL:URL];
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    self.task = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:config];
    }
    
    return self;
}

- (instancetype)initWithURL:(NSURL *)URL {
    self = [self init];
    if (self) {
        self.URL = URL;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

-(VBObjectCache *)cache {
    return [VBObjectCache sharedObject];
}

- (void)setURL:(NSURL *)URL {
    if (![_URL isEqual:URL]) {
        _URL = URL;
        
        [self dump];
    }
    
    [self load];
}

- (NSString *)fileName {
    NSArray *componentsArray = [self.URL pathComponents];
    NSString *fileName = [NSString stringWithFormat:@"%@_%@",
                          componentsArray[1], [self.URL lastPathComponent]];
    return fileName;
}

- (NSString *)path {
    return [NSFileManager pathFileWithName:self.fileName];
}

- (BOOL)isCached {
    return [self.cache isCachedWithKey:self.URL];
}

-(void)setTask:(NSURLSessionDownloadTask *)task {
    if (_task != task) {
        [_task cancel];
        _task = task;
        [_task resume];
    }
}

#pragma mark -
#pragma mark Public

- (void)prepareToLoad {
    if (self.URL.isFileURL || self.isCached) {
        [self loadFromFile];
    } else {
        [self download];
    }
}

- (void)dump {
    self.state = kVBModelUndefinedState;
}

#pragma mark -
#pragma mark Private

- (void)download {
    NSURL *URL = self.URL;
    id block = ^(NSURL *location, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSString *path = self.path;
            NSError *saveError = nil;
            NSFileManager *manager = [NSFileManager defaultManager];
            if (!self.isCached && [manager fileExistsAtPath:path]) {
                [manager removeItemAtPath:path error:nil];
            }
            
            [manager copyItemAtURL:location toURL:[NSURL fileURLWithPath:path] error:&saveError];
            if (!saveError) {
                [self.cache setObject:self.fileName forKey:URL];
            }
            
            [self loadFromFile];
        }
    };
    
    self.task = [self.session downloadTaskWithURL:URL completionHandler:block];
}

- (void)loadFromFile {
    UIImage *image = [UIImage imageWithContentsOfFile:self.path];
    if (!image) {
        [self removeIfNeeded];
    } else {
        self.image = image;
    }
    
    [self completionLoad];
}

- (void)completionLoad {
    VBWeakSelfMacro;
    VBDispatchAsyncOnMainThread(^{
        VBStrongSelfAndReturnNilMacro;
        NSUInteger state = strongSelf.image ? kVBModelLoadedState : kVBModelFailedState;
        [strongSelf setState:state withObject:strongSelf.image];
    });
}

- (void)removeIfNeeded {
    if (self.isCached) {
        NSError *error = nil;
        [[NSFileManager defaultManager] removeItemAtPath:self.path error:&error];
        [self.cache removeObjectForKey:self.URL];
    }
}

@end
