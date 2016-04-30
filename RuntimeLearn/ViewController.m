//
//  ViewController.m
//  RuntimeLearn
//
//  Created by 戴尼玛 on 16/4/26.
//  Copyright © 2016年 MIMO. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "UIButton+ClickBlock.h"
#import "NSObject+KeyValues.h"
#import "TestModel.h"
#import "Monkey.h"
#import "TestClass.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSDictionary *dictionary;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dictionary = @{
                     @"name":@"Dave Ping",
                     @"age":@24,
                     @"phoneNumber":@18718871111,
                     @"height":@180.5,
                     @"info":@{
                             @"address":@"Guangzhou",
                             },
                     @"son":@{
                             @"name":@"Jack",
                             @"info":@{
                                     @"address":@"London",
                                     },
                             }
                     };
    
    
//    [self categoryTest];


//    [self keyValuesTest];


//    [self keyedArchiverTest];


//    [self forwardingTest];
    
    
    [self msgSendTest];
    
}

-(void)categoryTest{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = self.view.bounds;
    [self.view addSubview:button];
    button.click = ^{
        NSLog(@"buttonClicked");
    };
}

-(void)keyValuesTest{
    
    TestModel *model = [TestModel objectWithKeyValues:dictionary];
    NSLog(@"name is %@",model.name);
    NSLog(@"son name is %@",model.son.name);
    
    NSDictionary *dict = [model keyValuesWithObject];
    NSLog(@"dict is %@",dict);
}

-(void)keyedArchiverTest{
    
    TestModel *model = [TestModel objectWithKeyValues:dictionary];
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    path = [path stringByAppendingPathComponent:@"test"];
    [NSKeyedArchiver archiveRootObject:model toFile:path];
    
    TestModel *m = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"m.name is %@",m.name);
    NSLog(@"m.son name is %@",m.son.name);
}

-(void)forwardingTest{
    Monkey *monkey = [[Monkey alloc] init];
    ((void (*) (id, SEL)) objc_msgSend) (monkey, sel_registerName("fly"));
}

-(void)msgSendTest{
    TestClass *objct = [[TestClass alloc] init];
    
    ((void (*) (id, SEL)) objc_msgSend) (objct, sel_registerName("showAge"));
    
    ((void (*) (id, SEL, NSString *)) objc_msgSend) (objct, sel_registerName("showName:"), @"Dave Ping");
    
    ((void (*) (id, SEL, float, float)) objc_msgSend) (objct, sel_registerName("showSizeWithWidth:andHeight:"), 110.5f, 200.0f);
    
    float f = ((float (*) (id, SEL)) objc_msgSend_fpret) (objct, sel_registerName("getHeight"));
    NSLog(@"height is %.2f",f);
    
    NSString *info = ((NSString* (*) (id, SEL)) objc_msgSend) (objct, sel_registerName("getInfo"));
    NSLog(@"%@",info);
}

@end
