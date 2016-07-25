//
//  ViewController.m
//  ToDoListUsingMvc
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.modelObjects = [[NSMutableArray alloc]init];
    
    ToDoListEmp* raghu = [[ToDoListEmp alloc]initWithName:@"raghu" designation:@"ios"];
    
    ToDoListEmp* meha = [[ToDoListEmp alloc]initWithName:@"Mehabbob" designation:@"Android"];
    
    ToDoListEmp* harish = [[ToDoListEmp alloc]initWithName:@"Harish" designation:@"ios"];
    
    [self.modelObjects addObjectsFromArray:@[raghu,meha,harish]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelObjects.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    ToDoListEmp* emp = self.modelObjects[indexPath.row];
    
    cell.textLabel.text = emp.empName;
    
    cell.detailTextLabel.text = emp.empDesignation;
    
    return cell;
}

@end
