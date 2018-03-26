//
//  FirstViewController.m
//  cell自适应
//
//  Created by CHE on 16/7/22.
//  Copyright © 2016年 CHE. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondTableViewCell.h"
#import "DetailModel.h"
#import "UIImageView+WebCache.h"

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *arrs;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    arrs=@[@"http://admin.sijiedu.com/uploadsfile/mistakes/changguiban/2017/xia/shuxue/jinpaiAban/wunianji/m_title_1_7.jpg",
                    @"http://admin.sijiedu.com/uploadsfile/mistakes/changguiban/2017/xia/shuxue/jinpaiAban/wunianji/m_analysis_1_7.jpg",
                    @"http://admin.sijiedu.com/uploadsfile/mistakes/changguiban/2017/xia/shuxue/jinpaiAban/wunianji/m_analysis_7_28.jpg",
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
    //all延伸到四周
    NSLog(@"=====%@",self.dataArr);
//    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
//        
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
//    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor=[UIColor yellowColor];
    [self initTableView];
    // Do any additional setup after loading the view.
}
-(void)initTableView
{
    UITableView *tab=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:tab];
    tab.delegate=self;
    tab.dataSource=self;
   
    tab.rowHeight = UITableViewAutomaticDimension;
    tab.estimatedRowHeight = 500;
    [tab registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"cell"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[SecondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    DetailModel *model=self.dataArr[indexPath.row];
//    cell.centerImg.image=[UIImage imageNamed:model.image];
    [cell.centerImg sd_setImageWithURL:[NSURL URLWithString:arrs[indexPath.row]]];
    cell.titleLab.text=model.title;
    cell.textView.text=@"点击查看更多信息>";
   
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    DetailModel *model=self.dataArr[indexPath.row];
    cell.textView.text=model.info;
    cell.textView.textAlignment=NSTextAlignmentCenter;
    [cell.contentView layoutIfNeeded];
//    [tableView beginUpdates];
//    [tableView endUpdates];
//    
//    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
