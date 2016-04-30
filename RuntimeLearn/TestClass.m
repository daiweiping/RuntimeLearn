//
//  TestClass.m
//  RuntimeLearn
//
//  Created by 戴尼玛 on 16/4/26.
//  Copyright © 2016年 MIMO. All rights reserved.
//

#import "TestClass.h"

@implementation TestClass

-(void)showAge{
    NSLog(@"24");
}

-(void)showName:(NSString *)aName{
    NSLog(@"name is %@",aName);
}

-(void)showSizeWithWidth:(float)aWidth andHeight:(float)aHeight{
    NSLog(@"size is %.2f * %.2f",aWidth, aHeight);
}

-(float)getHeight{
    return 187.5f;
}

-(NSString *)getInfo{
    return @"Hi, my name is Dave Ping, I'm twenty-four years old in the year, I like apple, nice to meet you.";
}

@end
