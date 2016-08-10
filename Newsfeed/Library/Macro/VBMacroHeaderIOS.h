//
//  VBMacroHeaderIOS.h
//  IOSProject
//
//  Created by Vladimir Budniy on 22.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBMacroHeaderIOS_h
#define VBMacroHeaderIOS_h


#define VBWeakSelfMacro \
    __weak __typeof(self) weakSelf = self \


#define VBStrongSelfAndReturnNilMacro \
    __strong __typeof(self) strongSelf = weakSelf; \
        if (!strongSelf) { \
            return; \
        }

#define VBRootViewAndReturnIfNilMacro(theClass) \
    - (theClass *)rootView { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[theClass class]]) { \
                return (theClass *)self.view; \
                    } \
                    return nil; \
                }

#endif /* VBMacroHeaderIOS_h */
