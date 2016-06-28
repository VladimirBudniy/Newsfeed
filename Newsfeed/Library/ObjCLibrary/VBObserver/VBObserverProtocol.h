//
//  VBObserverProtocol.h
//  C project
//
//  Created by Vladimir Budniy on 15.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VBObserverProtocol <NSObject>

@optional
- (void)employeeBecameFree:(id)employee;
- (void)employeeBecameBusy:(id)employee;
- (void)employeeBecameStandby:(id)employee;

@end
