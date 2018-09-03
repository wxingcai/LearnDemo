//
//  Person.h
//  LearnDemo
//
//  Created by 王兴财 on 2018/6/14.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SayHello)(void);

@protocol MyDelegate <NSObject>
@required
- (void)eat:(NSString *)foodName;
@optional
- (void)run;
@end

@interface Person : NSObject<MyDelegate>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;

+ (void)run;
- (void)study;
- (void)test;
@end
