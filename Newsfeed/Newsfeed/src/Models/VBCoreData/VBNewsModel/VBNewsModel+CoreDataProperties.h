//
//  VBNewsModel+CoreDataProperties.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "VBNewsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface VBNewsModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *category;
@property (nullable, nonatomic, retain) NSString *fullText;
@property (nullable, nonatomic, retain) NSString *pubDate;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *urlString;

@property (nullable, nonatomic, retain) VBNewsFeed *newsFeed;

@end

NS_ASSUME_NONNULL_END
