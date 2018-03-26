//
//  peopleModel.h
//  cell自适应
//
//  Created by CHE on 16/7/22.
//  Copyright © 2016年 CHE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface peopleModel : NSObject
@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSString *bio;
@property(nonatomic,retain)NSString *image;
@property(nonatomic,retain)NSArray *works;

+(NSArray*)loadResource;
@end
