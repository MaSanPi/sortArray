//
//  ViewController.m
//  sortArray
//
//  Created by 马波 on 2018/9/12.
//  Copyright © 2018年 MB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *titleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArray=@[@"升序",@"降序",@"乱序",@"模型数组按时间排序",@"模型数组按时间分组排序",@"模型数组乱序"];
    self.tableView.tableFooterView=[[UIView alloc]init];
    
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
