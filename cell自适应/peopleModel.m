//
//  peopleModel.m
//  cell自适应
//
//  Created by CHE on 16/7/22.
//  Copyright © 2016年 CHE. All rights reserved.
//

#import "peopleModel.h"
#import <UIKit/UIKit.h>
@implementation peopleModel
-(void)initWithDic:(NSDictionary*)dic
{
        self.name=dic[@"name"];
        self.bio=dic[@"bio"];
        self.image=dic[@"image"];
        self.works=dic[@"works"];
   
}
+(NSArray*)loadResource
{
    NSString *resoure=[[NSBundle mainBundle]pathForResource:@"artists" ofType:@"json"];
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:resoure] options:NSJSONReadingMutableContainers error:nil];
    NSArray *arr=dic[@"artists"];
    NSMutableArray *arr1=[NSMutableArray array];
    NSArray *arrs=@[@"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1780193/dots18.gif",
                    @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1809343/dots17.1.gif",
                    @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1845612/dots22.gif",
                    @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1820014/big-hero-6.gif",
                    @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1819006/dots11.0.gif",
                    @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1799885/dots21.gif", @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/2025999/batman-beyond-the-rain.gif",
                    @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/1855350/r_nin.gif",
                    @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/1963497/way-back-home.gif",
                    @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/1913272/depressed-slurp-cycle.gif",
                    @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1799885/dots21.gif",@"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1780193/dots18.gif",
                    @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1809343/dots17.1.gif",
                    @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1845612/dots22.gif",
                    @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1820014/big-hero-6.gif",
                    @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1819006/dots11.0.gif",
                    @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1799885/dots21.gif"];
    for (int i=0; i<arr.count; i++) {
        peopleModel *model=[self new];
        model.name=arr[i][@"name"];
        model.bio=arr[i][@"bio"];
//        model.image=arr[i][@"image"];
        model.image=arrs[i];
        model.works=arr[i][@"works"];
        [arr1 addObject:model];
    }
    return arr1;
}
@end
