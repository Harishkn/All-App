//
//  ViewController2.m
//  ScroolViewAndTableView
//
//  Created by test on 5/5/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"
#import "TableViewCell.h"
#import "StudentDataModel.h"
@interface ViewController2 ()<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic)NSMutableArray* dataList;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataList = [[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)receiveArray:(NSMutableArray*)receivedArray
{
    receivedArray = [[NSMutableArray alloc]init];
    self.dataList = receivedArray;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    StudentDataModel *model = self.dataList[indexPath.row];
    
    cell.nameLbl.text = model.sName;
    cell.usnLbl.text = model.sNumber;
    cell.branchLbl.text = model.sBranch;
    
    return cell;
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
