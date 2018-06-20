//
//  Person+AddProperty.m
//  LearnDemo
//
//  Created by 王兴财 on 2018/6/14.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//

#import "Person+AddProperty.h"
#import <objc/runtime.h>

@implementation Person (AddProperty)

- (void)setAddress:(NSString *)address{
    objc_setAssociatedObject(self, "address", address, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)address{
    return objc_getAssociatedObject(self, "address");
}

- (NSString *)description{
    return NSStringFromSelector(_cmd);
}

@end
