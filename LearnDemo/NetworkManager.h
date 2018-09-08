//
//  NetworkManager.h
//  LearnDemo
//
//  Created by 王兴文 on 2018/9/8.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompletionBlock)(NSDictionary *response,NSError *error);

@interface NetworkManager : NSObject

+ (void)requestWithPath:(NSString *)path params:(NSDictionary *)params completion:(CompletionBlock)completion;

@end
