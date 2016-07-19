//
//  VBNewsModel.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 19.07.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBNewsModel : NSObject
@property (nonatomic, strong) NSString  *title;
@property (nonatomic, strong) NSString  *urlString;
@property (nonatomic, strong) NSString  *fullText;
@property (nonatomic, strong) NSDate    *pubDate;
@property (nonatomic, strong) NSString  *category;

+ (instancetype)newsModelWithTitle:(NSString *)title
                          category:(NSString *)category
                           pubDate:(NSDate *)pubDate
                          fullText:(NSString *)fullText
                         urlString:(NSString *)urlString;

@end
