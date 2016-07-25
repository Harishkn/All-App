//
//  ViewController2.m
//  CustomTableApp
//
//  Created by test on 4/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController2 ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)NSArray* receiveArray;
@property(strong,nonatomic)UIImage* images;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
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

-(void)receiveArray:(NSArray*)receviData;
{
    self.receiveArray = receviData;
}

-(void)receiveImage:(UIImage *)disImage
{
    self.images = disImage;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.empNamelbl.text =[NSString stringWithFormat:@"Name:%@",[self.receiveArray objectAtIndex:0]];
    
    cell.designationlbl.text = [NSString stringWithFormat:@"Designation:%@",[self.receiveArray objectAtIndex:1]];
    
    cell.emailIDlbl.text = [NSString stringWithFormat:@"EmailId:%@",[self.receiveArray objectAtIndex:2]];
    
    cell.ageLbl.text = [NSString stringWithFormat:@"Age:%@",[self.receiveArray objectAtIndex:3]];
    
    cell.mobileNumberLbl.text = [NSString stringWithFormat:@"Mobile Number:%@",[self.receiveArray objectAtIndex:4]];
    
    cell.locationLbl.text = [NSString stringWithFormat:@"Location:%@",[self.receiveArray objectAtIndex:5]];
    
    cell.imageDisplay.image = [UIImage imageNamed:@"a"];
    
    return cell;
    
}

@end
