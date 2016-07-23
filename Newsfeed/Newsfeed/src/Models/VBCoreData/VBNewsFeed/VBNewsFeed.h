//
//  VBNewsFeed.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 24.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class VBNewsModel;

NS_ASSUME_NONNULL_BEGIN

@interface VBNewsFeed : NSManagedObject
@property (nonatomic, strong) NSArray  *news;
@property (nonatomic, assign) BOOL     wasCreate;

+ (instancetype)newsFeedWithArray:(NSArray *)news;

+ (instancetype)newsFeedObject;

@end

NS_ASSUME_NONNULL_END

#import "VBNewsFeed+CoreDataProperties.h"
