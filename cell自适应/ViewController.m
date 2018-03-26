//
//  ViewController.m
//  cell自适应
//
//  Created by CHE on 16/7/22.
//  Copyright © 2016年 CHE. All rights reserved.
//

#import "ViewController.h"
#import "peopleModel.h"
#import "NewTableViewCell.h"
#import "FirstViewController.h"
#import "DetailModel.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)NSArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
   self.dataArr =  [peopleModel loadResource];
    //NSLog(@"arr===%@",_dataArr);
    [self initTableView];
}
-(void)initTableView
{
    UITableView *tabView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tabView.delegate=self;
    tabView.dataSource=self;
    [self.view addSubview:tabView];
    tabView.rowHeight = UITableViewAutomaticDimension;
    tabView.estimatedRowHeight = 140;
    [tabView registerClass:[NewTableViewCell class] forCellReuseIdentifier:@"cell"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[NewTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    peopleModel *model=self.dataArr[indexPath.row];
    cell.nameLab.text=model.bio;
//    cell.artImage.image=[UIImage imageNamed:model.image];
    [cell.artImage sd_setImageWithURL:[NSURL URLWithString:model.image]];
    cell.botLab.text=model.name;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    peopleModel *model=self.dataArr[indexPath.row];
    NSMutableArray *arr1=[NSMutableArray array];
    NSArray *arr=model.works;
    for (int i=0; i<arr.count; i++) {
        DetailModel *dmodel=[[DetailModel alloc]initWithDic:arr[i]];
        [arr1 addObject:dmodel];
    }
    FirstViewController *first=[[FirstViewController alloc]init];
    first.dataArr=arr1;
    [self.navigationController pushViewController:first animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
