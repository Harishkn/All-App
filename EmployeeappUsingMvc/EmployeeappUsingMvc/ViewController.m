//
//  ViewController.m
//  EmployeeappUsingMvc
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "EmployeeDetails.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(strong,nonatomic) NSIndexPath* path;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.modelList = [[NSMutableArray alloc]init];
    
    EmployeeDetails* harish = [[EmployeeDetails alloc]initWithName:@"harish" designation:@"IOS" age:@"24" mobileNumber:@"8722131314"];
    
    EmployeeDetails* bhaskar = [[EmployeeDetails alloc]initWithName:@"Bhaskar" designation:@"IOS" age:@"24" mobileNumber:@"872243333"];
    
    [self.modelList addObjectsFromArray:@[harish,bhaskar]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    EmployeeDetails* emp = self.modelList[indexPath.row];
    
    cell.nameLbl.text = emp.empName;
    cell.ageLbl.text = emp.empAge;
    cell.designLbl.text = emp.empDesignation;
    cell.numberLbl.text = emp.empMobileNumber;
    return cell;
}

//-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//
//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    
//    if (editingStyle==UITableViewCellEditingStyleDelete)
//    {
//        [self.modelList removeObjectAtIndex:indexPath.row];
//        [self.tableView reloadData];
//    }
//    
//   }
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.storeValue = (int)indexPath.row;
    
    
}

- (IBAction)addEmployee:(id)sender
{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Enter employee Name"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *name)
     {
         name.placeholder = NSLocalizedString(@"Enter Name", @"Text");
         
     }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *age)
     {
         age.placeholder = NSLocalizedString(@"Enter age", @"Text");
         }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *designation)
     {
         designation.placeholder = NSLocalizedString(@"Enter Designation", @"Text");
         
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *number)
     {
         number.placeholder = NSLocalizedString(@"Enter Mopbile Number", @"Text");
         
     }];
         
     
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   UITextField *name = [alertController.textFields objectAtIndex:0];
                                   UITextField *age = [alertController.textFields objectAtIndex:1];
                                   UITextField *designation = [alertController.textFields  objectAtIndex:2];
                                   UITextField *number = [alertController.textFields objectAtIndex:3];
                                   
                                   
                                   EmployeeDetails* dynamicData = [[EmployeeDetails alloc]initWithName:name.text designation:designation.text age:age.text
                                                                                          mobileNumber:number.text];
                                   
[self.modelList addObjectsFromArray:@[dynamicData]];                                   [self.tableView reloadData];
                               }];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];

}

- (IBAction)leftSwipeEdit:(UIGestureRecognizer*)sender
{
    CGPoint location = [sender locationInView:self.tableView];
    self.path = [self.tableView indexPathForRowAtPoint:location];
    TableViewCell* cell = [self.tableView cellForRowAtIndexPath:self.path];
    
    cell.editButton.hidden = NO;
    cell.deleteButton.hidden = NO;
    
}
- (IBAction)rigthSwipeToHide:(id)sender
{
    CGPoint location = [sender locationInView:self.tableView];
    self.path = [self.tableView indexPathForRowAtPoint:location];
    TableViewCell* cell = [self.tableView cellForRowAtIndexPath:self.path];
    
    cell.editButton.hidden = YES;
    cell.deleteButton.hidden = YES;
    
}
@end
