//
//  CourseTableViewCell.m
//  LearnDemo
//
//  Created by 王兴财 on 2018/9/3.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//

#import "CourseTableViewCell.h"
#import "CourseModel.h"
@implementation CourseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imgView = [[UIImageView alloc]init];
        _imgView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_imgView];
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(8);
            make.top.equalTo(self.contentView).with.offset(19);
            make.bottom.equalTo(self.contentView).with.offset(-19);
            make.size.mas_equalTo(CGSizeMake(101, 71));
        }];
        
        _titleLbl = [[UILabel alloc]init];
        _titleLbl.textColor = [UIColor darkGrayColor];
        _titleLbl.numberOfLines = 0;
        _titleLbl.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_titleLbl];
        [_titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(124);
            make.top.equalTo(self.contentView).with.offset(18);
            make.right.equalTo(self.contentView).with.mas_offset(-8);
            make.height.greaterThanOrEqualTo(@20);
        }];
    }
    return self;
}

- (void)updateCellData:(CourseModel *)courseModel{
    
    NSString * imageName = [NSString stringWithFormat:@"http://file.schooledu.com.cn/static/%@", courseModel.image];
    [_imgView  sd_setImageWithURL:[NSURL URLWithString:imageName]];
    
    _titleLbl.text = courseModel.cName;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
