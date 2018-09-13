//
//  ViewController.m
//  sortArray
//
//  Created by 马波 on 2018/9/12.
//  Copyright © 2018年 MB. All rights reserved.
//

#import "ViewController.h"
#import "modleArrayTimeSortVc.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *classArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArray=@[@"升序",@"降序",@"乱序",@"模型数组按时间排序",@"模型数组按时间分组排序",@"模型数组乱序"];
    self.classArray=@[@"升序",@"降序",@"乱序",@"modleArrayTimeSortVc",@"模型数组按时间分组排序",@"模型数组乱序"];;
    
    self.tableView.tableFooterView=[[UIView alloc]init];
    self.title=@"数组排序";
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    NSString *vcClass=self.classArray[indexPath.row];
     UIViewController *subViewController = [[NSClassFromString(vcClass) alloc] init];
    subViewController.title=self.titleArray[indexPath.row];
    [self.navigationController pushViewController:subViewController animated:YES];
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CELLID"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELLID"];
    }
    
    cell.textLabel.text=self.titleArray[indexPath.row];
    return cell;
    
}




@end
