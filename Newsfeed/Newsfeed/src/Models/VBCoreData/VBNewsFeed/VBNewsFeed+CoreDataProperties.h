//
//  VBNewsFeed+CoreDataProperties.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 24.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "VBNewsFeed.h"

NS_ASSUME_NONNULL_BEGIN

@interface VBNewsFeed (CoreDataProperties)

@property (nullable, nonatomic, retain) NSSet<VBNewsModel *> *newsModels;

@end

@interface VBNewsFeed (CoreDataGeneratedAccessors)

- (void)addNewsModelsObject:(VBNewsModel *)value;
- (void)removeNewsModelsObject:(VBNewsModel *)value;
- (void)addNewsModels:(NSSet<VBNewsModel *> *)values;
- (void)removeNewsModels:(NSSet<VBNewsModel *> *)values;

@end

NS_ASSUME_NONNULL_END
