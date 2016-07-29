//
//  VBConstants.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBConstants_h
#define VBConstants_h

static NSString * const kVBAllNewsCategoryName              = @"Всі новини";
static NSString * const kVBUkraineNewsCategoryName          = @"Новини України";
static NSString * const kVBATOCategoryName                  = @"Новини АТО";
static NSString * const kVCitymCategoryName                 = @"Новини Києва";
static NSString * const kVBWorldNewsCategoryName            = @"Новини світу";
static NSString * const kVBPoliticsCategoryName             = @"Політика";
static NSString * const kVBEconomicCategoryName             = @"Фінанси";
static NSString * const kVBTechnologiesNewsCategoryName     = @"Новини науки та IT";
static NSString * const kVBGlamourCategoryName              = @"Світськи новини";
static NSString * const kVBSportCategoryName                = @"Спорт";
static NSString * const kVBTourismCategoryName              = @"Туризм";
static NSString * const kVBInterestingCategoryName          = @"Цікавинки";

typedef enum {
    kVBAllNewsCategory,
    kVBUkraineNewsCategory,
    kVBATOCategory,
    kVCitymCategory,
    kVBWorldNewsCategory,
    kVBPoliticsCategory,
    kVBEconomicCategory,
    kVBTechnologiesNewsCategory,
    kVBGlamourCategory,
    kVBSportCategory,
    kVBTourismCategory,
    kVBInterestingCategory
} kVBCategoiesType;

#endif /* VBConstants_h */
