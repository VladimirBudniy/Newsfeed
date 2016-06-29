//
//  VBNewsImage+CoreDataProperties.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 29.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "VBNewsImage.h"

NS_ASSUME_NONNULL_BEGIN

@interface VBNewsImage (CoreDataProperties)

@property (nonatomic, strong)   NSString    *urlString;
@property (nonatomic, strong)   VBNewsModel *news;

@end

NS_ASSUME_NONNULL_END
