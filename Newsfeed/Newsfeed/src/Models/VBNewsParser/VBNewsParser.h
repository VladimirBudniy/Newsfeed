//
//  VBNewsParser.h
//  Newsfeed
//
//  Created by Vladimir Budniy on 29.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBModel.h"

@interface VBNewsParser : VBModel <NSXMLParserDelegate>

- (instancetype)initWithURL:(NSURL *)URL;

@end
