//
//  VBNewsModel+CoreDataProperties.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 24.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "VBNewsModel+CoreDataProperties.h"

@implementation VBNewsModel (CoreDataProperties)

@dynamic title;
@dynamic urlString;
@dynamic fullText;
@dynamic pubDate;
@dynamic category;
@dynamic newsFeed;

@end
