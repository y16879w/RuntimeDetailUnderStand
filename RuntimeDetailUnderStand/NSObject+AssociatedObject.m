//
//  NSObject+AssociatedObject.m
//  RuntimeDetailUnderStand
//
//  Created by 李艳敏 on 2019/1/1.
//  Copyright © 2019年 李艳敏. All rights reserved.
//

#import "NSObject+AssociatedObject.h"
#import <objc/runtime.h>
@implementation NSObject (AssociatedObject)
- (void)setAssociatedObject:(id)associatedObject {
    objc_setAssociatedObject(self, @selector(associatedObject), associatedObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)associatedObject {
    return objc_getAssociatedObject(self, _cmd);
}
@end
