//
//  NewTableViewCell.m
//  cell自适应
//
//  Created by CHE on 16/7/22.
//  Copyright © 2016年 CHE. All rights reserved.
//

#import "NewTableViewCell.h"
#import "Masonry.h"
@implementation NewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
                CGFloat width=self.frame.size.width;
             UILabel *botLab=[[UILabel alloc]init];
        [self addSubview:botLab];
        self.botLab=botLab;
        botLab.backgroundColor=[UIColor grayColor];
        UILabel *lab=[[UILabel alloc]init];
        [self addSubview:lab];
        lab.numberOfLines=0;
        self.nameLab=lab;

        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.mas_offset(UIEdgeInsetsMake(10,width/2+20, 10, 10));
        }];
        UIImageView *imgV=[[UIImageView alloc]init];
        [self addSubview:imgV];
        self.artImage=imgV;
        imgV.backgroundColor=[UIColor redColor];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lab.mas_top);
                      make.width.offset=150;
        }];
              [botLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imgV.mas_bottom).with.offset(10);
            make.bottom.equalTo(lab.mas_bottom).with.offset=0;
                make.width.equalTo(imgV.mas_width);

        }];
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
