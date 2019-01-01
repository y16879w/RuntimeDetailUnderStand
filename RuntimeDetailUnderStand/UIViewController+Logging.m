//
//  UIViewController+Logging.m
//  RuntimeDetailUnderStand
//
//  Created by 李艳敏 on 2019/1/1.
//  Copyright © 2019年 李艳敏. All rights reserved.
//

#import "UIViewController+Logging.h"
#import <objc/runtime.h>
@implementation UIViewController (Logging)
+ (void)load {
    swizzleMethod(self, @selector(viewDidAppear:), @selector(swizzled_viewDidAppear:));
}

- (void)swizzled_viewDidAppear:(BOOL)animated {
    [self swizzled_viewDidAppear:animated];
    NSLog(@"%@",NSStringFromClass([self class]));
}
void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}
@end
