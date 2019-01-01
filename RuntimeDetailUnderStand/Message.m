//
//  Message.m
//  RuntimeDetailUnderStand
//
//  Created by 李艳敏 on 2019/1/1.
//  Copyright © 2019年 李艳敏. All rights reserved.
//

#import "Message.h"
#import <objc/runtime.h>
#import "MessageForwarding.h"
@implementation Message
//- (void)sendMessage:(NSString *)word {
//    NSLog(@"normal way send message = %@",word);
//}

//消息重发 message resolution
//+ (BOOL)resolveClassMethod:(SEL)sel {
//    if (sel == @selector(sendMessage:)) {
//        class_addMethod(self, sel, imp_implementationWithBlock(^(id self, NSString *word){
//            NSLog(@"send message = %@",word);
//        }),"v@*");
//    }
//    return YES;
//}

//消息转发 Fast forwarding
//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    if (aSelector == @selector(sendMessage:)) {
//        return [MessageForwarding new];
//    }
//
//    return nil;
//}


//Normal Forwarding  
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
    if (!methodSignature) {
        methodSignature = [NSMethodSignature signatureWithObjCTypes:"V@:*"];
    }
    return methodSignature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    MessageForwarding *messageForwaring = [MessageForwarding new];
    if ([messageForwaring respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:messageForwaring];
    }
}
@end
