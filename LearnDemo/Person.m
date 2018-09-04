//
//  Person.m
//  LearnDemo
//
//  Created by 王兴财 on 2018/6/14.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)eat:(NSString *)foodName{
    NSLog(@"吃:%@!", foodName);
}

- (void)run{
    NSLog(@"run");
}

+ (void)run{
    NSLog(@"run....%@", self);
}

- (void)study{
    NSLog(@"study....%@", self);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(test)) {
        NSLog(@"resolveInstanceMethod:");
        return NO;
    }else{
        return [super resolveInstanceMethod:sel];
    }
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    NSLog(@"forwardingTargetForSelector:");
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if (aSelector == @selector(test)) {
        NSLog(@"methodSignatureForSelector:");
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }else{
        return [super methodSignatureForSelector:aSelector];
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"forwardInvocation:");
}

@end
