//
//  DetailModel.m
//  cell自适应
//
//  Created by CHE on 16/7/22.
//  Copyright © 2016年 CHE. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel
-(instancetype)initWithDic:(NSDictionary*)dic
{
    self=[super init];
    if (self) {
        self.title=dic[@"title"];
        self.image=dic[@"image"];
        self.info=dic[@"info"];
    }
    return self;
}

@end
