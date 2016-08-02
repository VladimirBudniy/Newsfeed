//
//  VBNewsModel+CoreDataProperties.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 02.08.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "VBNewsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface VBNewsModel (CoreDataProperties)

@property (nonatomic, strong)  NSString *newsCategory;
@property (nonatomic, strong)  NSString *fullText;
@property (nonatomic, strong)  NSString *pubDate;
@property (nonatomic, strong)  NSString *title;
@property (nonatomic, strong)  NSString *urlString;

@property (nonatomic, strong)  VBNewsFeed *newsFeed;

@end

NS_ASSUME_NONNULL_END
