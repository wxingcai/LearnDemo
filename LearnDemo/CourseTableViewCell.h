//
//  CourseTableViewCell.h
//  LearnDemo
//
//  Created by 王兴财 on 2018/9/3.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CourseModel;
@interface CourseTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView * imgView;
@property (nonatomic, strong) UILabel * titleLbl;

- (void)updateCellData:(CourseModel *)courseModel;

@end
