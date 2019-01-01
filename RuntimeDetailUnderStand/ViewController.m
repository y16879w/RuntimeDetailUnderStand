//
//  ViewController.m
//  RuntimeDetailUnderStand
//
//  Created by 李艳敏 on 2019/1/1.
//  Copyright © 2019年 李艳敏. All rights reserved.
//

#import "ViewController.h"
#import "Message.h"
#import "NSObject+AssociatedObject.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Message *message = [Message new];
    [message sendMessage:@"Tom"];
    
    NSObject *objc = [NSObject new];
    objc.associatedObject = @"Extend Category";
    NSLog(@"associatedObject is = %@",objc.associatedObject);
    
}


@end
