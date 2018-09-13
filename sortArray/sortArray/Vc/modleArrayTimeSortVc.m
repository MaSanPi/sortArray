//
//  modleArrayTimeSortVc.m
//  sortArray
//
//  Created by 马波 on 2018/9/13.
//  Copyright © 2018年 MB. All rights reserved.
//

#import "modleArrayTimeSortVc.h"
#import "sortArrayModle.h"
@interface modleArrayTimeSortVc ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *ModleArray;

@end

@implementation modleArrayTimeSortVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView=[[UIView alloc]init];
    [self initData];
    
}


- (IBAction)sortClick:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:{
            [self groupActionWithOrder:YES];
        }
            break;
        case 1:{
            [self groupActionWithOrder:NO];
        }
            break;
        default:
            break;
    }
    
}

#pragma mark--对模型数组按时间排序
-(void)groupActionWithOrder:(BOOL)order {
    if (order) {
    self.ModleArray=[self.ModleArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        sortArrayModle *Model1 = obj1;
        sortArrayModle *Model2 = obj2;
        if (Model1.time< Model2.time) {
            return NSOrderedDescending;
        } else if (Model1.time > Model2.time) {
            return NSOrderedAscending;
        }
        return NSOrderedSame;
        
    }].mutableCopy;
    
    }else{
        self.ModleArray=[self.ModleArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            
            sortArrayModle *Model1 = obj1;
            sortArrayModle *Model2 = obj2;
            
            if (Model1.time> Model2.time) {
                return NSOrderedDescending;
                
            } else if (Model1.time < Model2.time) {
                return NSOrderedAscending;
            }
            return NSOrderedSame;
            
        }].mutableCopy;
    }
    
    [self.tableView reloadData];
}

-(void)initData{
    for (NSInteger index=0; index<8; index++) {
        sortArrayModle *modle=[[sortArrayModle alloc]init];
        modle.time=1536809954-arc4random()/1000;
        [self.ModleArray addObject:modle];
    }

    [self.tableView reloadData];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ModleArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CELLID"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELLID"];
    }
    sortArrayModle *modle=self.ModleArray[indexPath.row];
    cell.textLabel.text=modle.date;
    return cell;
    
}

- (NSMutableArray *)ModleArray {
    if (_ModleArray==nil){
        _ModleArray=[[NSMutableArray alloc] init];
    }
    return _ModleArray;
}

@end
