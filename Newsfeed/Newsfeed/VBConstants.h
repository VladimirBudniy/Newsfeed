//
//  VBConstants.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBConstants_h
#define VBConstants_h

#define VBCustormColor [UIColor colorWithRed:100.0/255.0f \
                                       green:149.0/255.0f \
                                        blue:237.0/255.0f \
                                       alpha:1.0f]

static NSString * const kVBPhotosFolderName = @"/Photos";

// constants for VBTableView's headers
static NSString * const kVBBarTitleTextStyle  = @"Helvetica";
static NSUInteger const kVBBarTitleTextSize   = 18;

// constants for VBNewsParser
static NSString * const kVBEnclosureKey     = @"enclosure";
static NSString * const kVBUrlKey           = @"url";
static NSString * const kVBTitleKey         = @"title";
static NSString * const kVBFulltextKey      = @"fulltext";
static NSString * const kVBCategoryKey      = @"category";
static NSString * const kVBPubDateKey       = @"pubDate";
static NSString * const kVBItemKey          = @"item";

static NSUInteger const kVBNewsCount        = 350;

//constants for VBLeftSlideViewController, categories names for VBLSVC
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
static NSString * const kVBInterestingCategoryName          = @"Цікавинки";
static NSString * const kVBHelpCategoryName                 = @"Допомога";

//constants for VBLeftSlideViewController, sort with original categories names
static NSString * const kVBAllNewsOriginalCategoryName              = @"Всі новини";
static NSString * const kVBUkraineNewsOriginalCategoryName          = @"Новини України на 1+1";
static NSString * const kVBATOOriginalCategoryName                  = @"Новини АТО - всі подробиці війни у Донецькій та Луганській областях";
static NSString * const kVCitymOriginalCategoryName                 = @"Новини Києва на 1+1";
static NSString * const kVBWorldNewsOriginalCategoryName            = @"Новини світу на 1+1";
static NSString * const kVBPoliticsOriginalCategoryName             = @"Політика";
static NSString * const kVBEconomicOriginalCategoryName             = @"Гроші, фінансові новини на 1+1";
static NSString * const kVBTechnologiesOriginalNewsCategoryName     = @"Новини технологій, науки та IT на 1+1";
static NSString * const kVBGlamourOriginalCategoryName              = @"Світські новини - гламур на 1+1";
static NSString * const kVBSportOriginalCategoryName                = @"Про спорт - новини спорту, все про спорт в Україні";
static NSString * const kVBInterestingOriginalCategoryName          = @"Все цікаве онлайн на 1+1";
static NSString * const kVBHelpOriginalCategoryName                 = @"Допомога";

// other original categories
//Профутбол
//Фото
//Випуски ТСН на 1+1 відео онлайн
//Випуски ТСН Тиждень на 1+1 відео онлайн
//Інтерв’ю
//Туризм
//Здоров’я та спорт
//Вікно
//Про життя

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
    kVBInterestingCategory,
    kVBHelpCategory
} kVBCategoryType;

#endif /* VBConstants_h */
