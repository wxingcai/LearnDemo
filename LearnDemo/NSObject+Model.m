//
//  NSObject+Model.m
//  LearnDemo
//
//  Created by 王兴财 on 2018/9/3.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/runtime.h>
@implementation NSObject (Model)

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    id objc = [[self alloc]init];
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        // 获取key
        NSString *key = [ivarName substringFromIndex:1];
        id value = dict[key];
        if ([value isKindOfClass:[NSNull class]] || value == nil) {
            continue;
        }
        if ([value isKindOfClass:[NSDictionary class]] && ![ivarType hasPrefix:@"NS"]) {
            // 转换成哪个模型
            
            // 获取类
            Class modelClass = NSClassFromString(ivarType);
            
            value = [modelClass modelWithDict:value];
        }else if (value) {
            [objc setValue:value forKey:key];
        }
    }
    return objc;
}

@end
