//
//  VBNewsModel+CoreDataProperties.m
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "VBNewsModel+CoreDataProperties.h"

@implementation VBNewsModel (CoreDataProperties)

@dynamic category;
@dynamic fullText;
@dynamic pubDate;
@dynamic title;
@dynamic urlString;
@dynamic newsFeed;

@end
