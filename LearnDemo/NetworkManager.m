//
//  NetworkManager.m
//  LearnDemo
//
//  Created by 王兴文 on 2018/9/8.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

+ (void)requestWithPath:(NSString *)path params:(NSDictionary *)params completion:(CompletionBlock)completion{
    
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.timeoutInterval = 10;
    request.HTTPMethod = @"POST";
    [request addValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
    [request setCachePolicy:NSURLRequestUseProtocolCachePolicy];
    NSMutableString *paramString = [[NSMutableString alloc]init];
    int pos = 1;
    for (NSString *key in params.allKeys) {
        [paramString appendFormat:@"%@=%@",key,params[key]];
        if (pos < params.count) {
            [paramString appendString:@"&"];
        }
    }
    NSData *paramData = [paramString dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = paramData;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"post error :%@", error.localizedDescription);
            completion(nil, error);
        }else{
            NSDictionary *jsons = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            if (error) {
                NSLog(@"post error :%@", error.localizedDescription);
                completion(nil, error);
            }else{
                NSLog(@"post success");
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(jsons, nil);
                });
            }
        }
    }];
    [task resume];
}

@end
