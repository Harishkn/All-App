//
//  ViewController.m
//  TableView
//
//  Created by test on 4/21/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSArray* tableData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableData = [NSArray arrayWithObjects:@"harish",@"bhaskar",@"nadaf",@"raghu", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return [self.tableData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableView = @"simpleTable";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableView];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableView];
    }
        cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    
    
    return cell;
}

@end
