//
//  SecondTableViewCell.m
//  cell自适应
//
//  Created by CHE on 16/7/22.
//  Copyright © 2016年 CHE. All rights reserved.
//

#import "SecondTableViewCell.h"
#import "Masonry.h"
@implementation SecondTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *centerImg=[[UIImageView alloc]init];
        centerImg.contentMode=UIViewContentModeScaleAspectFit;
       [self addSubview:centerImg];
        UILabel *lab=[[UILabel alloc]init];
        lab.numberOfLines=0;
        [self addSubview:lab];
        lab.textAlignment=NSTextAlignmentCenter;
        UITextView *textView=[[UITextView alloc]init];
        textView.scrollEnabled=NO;
        textView.textAlignment=NSTextAlignmentCenter;
        textView.userInteractionEnabled=NO;
        [self addSubview:textView];
        self.centerImg=centerImg;
        self.titleLab=lab;
        self.textView=textView;
        [centerImg mas_makeConstraints:^(MASConstraintMaker *make) {
         //  make.edges.mas_offset(UIEdgeInsetsMake(10,10, 80, 10));
            make.top.mas_offset(0);
            make.left.mas_offset(8);
            make.bottom.mas_equalTo(lab.mas_top).offset(-10);
             make.right.mas_offset(-10);
        }];
                [lab mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(centerImg.mas_bottom).offset(10);
                    make.width.equalTo(textView.mas_width);
                    make.bottom.equalTo(textView.mas_top).with.offset(-10);
                }];
                [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        
                    make.left.mas_equalTo(centerImg.mas_left);
                    make.right.mas_equalTo(centerImg.mas_right);
                   make.bottom.mas_offset(-20);
                        }];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
