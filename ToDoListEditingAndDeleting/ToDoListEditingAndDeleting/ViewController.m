//
//  ViewController.m
//  ToDoListEditingAndDeleting
//
//  Created by test on 5/5/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "EmployeeModel.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(strong,nonatomic)NSIndexPath* path;

@property(assign,nonatomic)int storeValue;

@property(strong,nonatomic)UITextField* agePlaceHolder;

@property(assign,nonatomic)int flag;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataModel = [[NSMutableArray alloc]init];
    
    EmployeeModel* harish = [[EmployeeModel alloc]initWithName:@"Harish" Age:24];
    
    EmployeeModel* bhaskar = [[EmployeeModel alloc]initWithName:@"Bhaskar" Age:24];
    
    [self.dataModel addObjectsFromArray:@[harish,bhaskar]];
    
    self.flag = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataModel.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell* cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    EmployeeModel *emp = self.dataModel[indexPath.row];
    
    cell.nameLbl.text = emp.empName;
    
    cell.ageLbl.text = [NSString stringWithFormat:@"%d",emp.empAge];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.storeValue = (int)indexPath.row;
}




- (IBAction)editButtonAction:(id)sender
{
    self.alertController = [UIAlertController
                                          alertControllerWithTitle:@"Enter employee Name"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [self.alertController addTextFieldWithConfigurationHandler:^(UITextField *name)
     {
         name.placeholder = NSLocalizedString(@"Enter Name", @"Text");
         
     }];
    [self.alertController addTextFieldWithConfigurationHandler:^(UITextField *age)
     {
         age.placeholder = NSLocalizedString(@"Enter age", @"Text");
     }];
    
    
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   UITextField *name = [self.alertController.textFields objectAtIndex:0];
                                   UITextField *age = [self.alertController.textFields objectAtIndex:1];
                                   
                                                                      EmployeeModel* dynamicData = [[EmployeeModel alloc]initWithName:name.text Age:age.text.intValue];
                                   
                                   [self.dataModel replaceObjectAtIndex:self.path.row withObject:dynamicData];
                                   [self.tableView reloadData];

                                                                  }];
    
    
    [self.alertController addAction:okAction];
    [self presentViewController:self.alertController animated:YES completion:nil];
     [self hideButtons];
    [self.tableView reloadData];
    

}
- (IBAction)deleteButtonAction:(id)sender
{
    [self.dataModel removeObjectAtIndex:self.path.row];
    
    [self hideButtons];
    
    
}
- (IBAction)rightSwipeToHide:(id)sender
{
    CGPoint location = [sender locationInView:self.tableView];
    self.path = [self.tableView indexPathForRowAtPoint:location];
    TableViewCell* cell = [self.tableView cellForRowAtIndexPath:self.path];
    
    cell.editButton.hidden = YES;
    cell.deleteButton.hidden = YES;

}
- (IBAction)leftSwipeToEditAndDelete:(id)sender
{
    CGPoint location = [sender locationInView:self.tableView];
    self.path = [self.tableView indexPathForRowAtPoint:location];
    TableViewCell* cell = [self.tableView cellForRowAtIndexPath:self.path];
    
    cell.editButton.hidden = NO;
    cell.deleteButton.hidden = NO;
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
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   //[UITextFieldTextDidEndEditingNotification ];
                                   UITextField *name = [alertController.textFields objectAtIndex:0];
                                   UITextField *age = [alertController.textFields objectAtIndex:1];
                                   
                                   if([name.text isEqualToString:@""])
                                   {
                                       UIColor *color = [UIColor redColor];
                                       name.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter correct Name" attributes:@{NSForegroundColorAttributeName: color}];
                                       [alertController reloadInputViews];
                                        [self presentViewController:alertController animated:YES completion:nil];
                                   }
                                   else if ([age.text isEqualToString:@""])
                                   {
                                       UIColor *color = [UIColor redColor];
                                       age.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter correct age" attributes:@{NSForegroundColorAttributeName: color}];
                                     
                                       [alertController reloadInputViews];
                                        [self presentViewController:alertController animated:YES completion:nil];
                                   }
                                   
                                   
                                       
                        
                                       
//                                   
//                                   EmployeeModel* dynamicData = [[EmployeeModel alloc]initWithName:name.text Age:age.text.intValue];
//                            
//                                   [self.dataModel addObject:dynamicData];
                                   
                           // [self.tableView reloadData];
                                   
              NSManagedObjectContext* context = [self getContext];
                                   NSManagedObject* emp = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
                                   
                                   
                                   [emp setValue:name.text forKey:@"name"];
                                   
                                   [emp setValue:[NSNumber numberWithInt:age.text.intValue] forKey:@"age"];
                                   
                                   NSError* error=nil;
                                   
                                   if ([context save:&error]) {
                                       [self fetchData];
                                   }

                               }];
  
    
                               
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    


}

-(void)hideButtons
{
    TableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.deleteButton.hidden = YES;
    cell.editButton.hidden = YES;
    
    [self.tableView reloadData];
}

-(void)showValidationAlert
{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Enter Valid data"
                                          message:@"name don't leave empty"
                                          preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alertController animated:YES completion:nil];
    

    

}
-(void)fetchData{
    
    NSManagedObjectContext* context=[self getContext];
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"Employee"];
    NSError* error=nil;
    
    self.dataModel=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    [self.tableView reloadData];
    // [self.modelObjects addObjectsFromArray:];
}

-(NSManagedObjectContext*)getContext
{
    AppDelegate* app = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext* context = [app managedObjectContext];
    return context;
    
}
@end
