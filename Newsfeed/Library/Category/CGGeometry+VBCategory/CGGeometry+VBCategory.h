//
//  CGGeometry+VBCategory.h
//  IOSProject
//
//  Created by Vladimir Budniy on 26.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

CG_INLINE CGRect
CGRectMakeWithSize(CGFloat x, CGFloat y, CGSize size) {
    return CGRectMake(x, y, size.width, size.height);
}

CG_INLINE CGRect
CGRectMakeWithPointSize(CGPoint point, CGSize size) {
    return CGRectMake(point.x, point.y, size.width, size.height);
}

CG_INLINE CGRect
CGRectMakeWithStartPointSize(CGSize size) {
    return CGRectMake(0, 0, size.width, size.height);
}