//
//  UIImage+Common.m
//  LearnDemo
//
//  Created by 王兴文 on 2018/6/21.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//

#import "UIImage+Common.h"

@implementation UIImage (Common)

- (UIImage *)circleImage{
    //使用绘图技术
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextClip(ctx);
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
