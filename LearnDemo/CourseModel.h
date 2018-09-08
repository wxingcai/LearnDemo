//
//  CourseModel.h
//  LearnDemo
//
//  Created by 王兴财 on 2018/9/3.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseModel : NSObject

@property (nonatomic, assign) NSInteger cId;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, assign) long buyCount;
@property (nonatomic, copy) NSString *cName;

@end
