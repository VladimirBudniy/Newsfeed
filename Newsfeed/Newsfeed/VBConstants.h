//
//  VBConstants.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 28.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBConstants_h
#define VBConstants_h

#define VBCustormColor [UIColor colorWithRed:88.0/255.0f \
                                       green:156.0/255.0f \
                                        blue:222.0/255.0f \
                                       alpha:1.0f]

static NSString * const kVBTsnRssUrlString    = @"http://tsn.ua/rss";

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

static NSUInteger const kVBNewsCount        = 550;

//constants for VBLeftSlideViewController, categories names for VBLSVC
static NSString * const kVBAllNewsCategoryName              = @"Всі новини";
static NSString * const kVBUkraineNewsCategoryName          = @"Події";
static NSString * const kVBATOCategoryName                  = @"АТО";
static NSString * const kVCityCategoryName                  = @"Київ";
static NSString * const kVBWorldNewsCategoryName            = @"За кордоном";
static NSString * const kVBPoliticsCategoryName             = @"Політика";
static NSString * const kVBEconomicCategoryName             = @"Економіка";
static NSString * const kVBTechnologiesNewsCategoryName     = @"Технологія";
static NSString * const kVBGlamourCategoryName              = @"Гламур";
static NSString * const kVBSportCategoryName                = @"Спорт";
static NSString * const kVBInterestingCategoryName          = @"Курйози";
static NSString * const kVBHelpCategoryName                 = @"Допомога";

//constants for VBLeftSlideViewController, categories images names for VBLSVC
static NSString * const kVBAllNewsImageName              = @"home";
static NSString * const kVBUkraineNewsImageName          = @"news_ukraine";
static NSString * const kVBATOImageName                  = @"news_ATO";
static NSString * const kVCityImageName                  = @"kiev";
static NSString * const kVBWorldNewsImageName            = @"world_news";
static NSString * const kVBPoliticsImageName             = @"politics";
static NSString * const kVBEconomicImageName             = @"business";
static NSString * const kVBTechnologiesNewsImageName     = @"it";
static NSString * const kVBGlamourImageName              = @"celeb";
static NSString * const kVBSportImageName                = @"sport";
static NSString * const kVBInterestingImageName          = @"joker";
static NSString * const kVBHelpImageName                 = @"health";

//constants for VBLeftSlideViewController, categories images names for VBLSVC
static NSString * const kVBAllNewsActionImageName              = @"home_action";
static NSString * const kVBUkraineNewsActionImageName          = @"news_ukraine_action";
static NSString * const kVBATOActionImageName                  = @"news_ATO_action";
static NSString * const kVCityActionImageName                  = @"kiev_action";
static NSString * const kVBWorldNewsActionImageName            = @"world_news_action";
static NSString * const kVBPoliticsActionImageName             = @"politics_action";
static NSString * const kVBEconomicActionImageName             = @"business_action";
static NSString * const kVBTechnologiesNewsActionImageName     = @"it_action";
static NSString * const kVBGlamourActionImageName              = @"celeb_action";
static NSString * const kVBSportActionImageName                = @"sport_action";
static NSString * const kVBInterestingActionImageName          = @"joker_action";
static NSString * const kVBHelpActionImageName                 = @"health_action";

//constants for VBLeftSlideViewController, sort with original categories names
static NSString * const kVBAllNewsOriginalCategoryName              = @"Всі новини";
static NSString * const kVBUkraineNewsOriginalCategoryName          = @"Події";
static NSString * const kVBATOOriginalCategoryName                  = @"АТО";
static NSString * const kVCitymOriginalCategoryName                 = @"Київ";
static NSString * const kVBWorldNewsOriginalCategoryName            = @"За кордоном";
static NSString * const kVBPoliticsOriginalCategoryName             = @"Політика";
static NSString * const kVBEconomicOriginalCategoryName             = @"Економіка";
static NSString * const kVBTechnologiesOriginalNewsCategoryName     = @"Технологія";
static NSString * const kVBGlamourOriginalCategoryName              = @"Гламур";
static NSString * const kVBSportOriginalCategoryName                = @"Спорт";
static NSString * const kVBInterestingOriginalCategoryName          = @"Курйози";
static NSString * const kVBHelpOriginalCategoryName                 = @"Допомога";

typedef enum {
    kVBAllNewsCategory,
    kVBUkraineNewsCategory,
    kVBATOCategory,
    kVCityCategory,
    kVBWorldNewsCategory,
    kVBPoliticsCategory,
    kVBEconomicCategory,
    kVBTechnologiesNewsCategory,
    kVBGlamourCategory,
    kVBSportCategory,
    kVBInterestingCategory,
    kVBHelpCategory
} kVBCategoryType;

//constants for clean NSString
static NSString * const kVBDoubleQuote        = @"&quot;";
static NSString * const kVBSingleQuote        = @"&#039;";
static NSString * const kVBLineFeed           = @"&#13;";
static NSString * const kVBDoubleQuoteKey     = @"\"";
static NSString * const kVBSingleQuoteKey     = @"\'";
static NSString * const kVBLineFeedKey        = @"\n";

#endif /* VBConstants_h */
