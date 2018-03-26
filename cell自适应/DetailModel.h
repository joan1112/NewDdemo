//
//  DetailModel.h
//  cell自适应
//
//  Created by CHE on 16/7/22.
//  Copyright © 2016年 CHE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DetailModel : NSObject
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSString *info;


-(instancetype)initWithDic:(NSDictionary*)dic;
@end
