//
//  Monkey.m
//  RuntimeLearn
//
//  Created by 戴尼玛 on 16/4/26.
//  Copyright © 2016年 MIMO. All rights reserved.
//

#import "Monkey.h"
#import "Bird.h"
#import <objc/runtime.h>

@implementation Monkey

-(void)jump{
    NSLog(@"monkey can not fly, but! monkey can jump");
}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    
    /*
     如果当前对象调用了一个不存在的方法
     Runtime会调用resolveInstanceMethod:来进行动态方法解析
     我们需要用class_addMethod函数完成向特定类添加特定方法实现的操作
     返回NO，则进入下一步forwardingTargetForSelector:
     */
    
#if 0
    return NO;
#else
    class_addMethod(self, sel, class_getMethodImplementation(self, sel_registerName("jump")), "v@:");
    return [super resolveInstanceMethod:sel];
#endif
}

-(id)forwardingTargetForSelector:(SEL)aSelector{
    
    /*
     在消息转发机制执行前，Runtime 系统会再给我们一次重定向的机会
     通过重载forwardingTargetForSelector:方法来替换消息的接受者为其他对象
     返回nil则进步下一步forwardInvocation:
     */
    
#if 0
    return nil;
#else
    return [[Bird alloc] init];
#endif
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    
    /*
     获取方法签名进入下一步，进行消息转发
     */
    
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

-(void)forwardInvocation:(NSInvocation *)anInvocation{
    
    /*
     消息转发
     */
    
    return [anInvocation invokeWithTarget:[[Bird alloc] init]];
}

@end
