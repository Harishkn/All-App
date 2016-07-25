//
//  ViewController.m
//  ToDoListUsingAlertView
//
//  Created by test on 5/2/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong,nonatomic)NSMutableArray* taskList;

@property (strong,nonatomic)NSDate* date;

@property (strong,nonatomic)NSDateFormatter *format;

@property(strong,nonatomic)NSString* printDate;

@property(strong,nonatomic)NSMutableArray *dateList;

@property (assign,nonatomic)int saveData;

@property (strong,nonatomic)NSString* saveString;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.taskList = [[NSMutableArray alloc]init];
    self.dateList = [[NSMutableArray alloc]init];
    
    ToDoList* list = [[ToDoList alloc]initWithName:@"Harish"];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.taskList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.taskList[indexPath.row];
    cell.detailTextLabel.text = self.dateList[indexPath.row];
    //self.printDate = nil;
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //self.saveData = (int)indexPath.row;
    self.saveString = [self.taskList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"scene2" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2* vc2 = [segue destinationViewController];
    
    //[vc2 receiveValues:self.saveData];
    [vc2 receiveStringValue:self.saveString];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete)
    {
        [self.taskList removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}


- (IBAction)addTask:(id)sender
{
    [self.tableView reloadData];
    self.date=[[NSDate alloc]init];
    self.format = [[NSDateFormatter alloc]init];

    
    [self.format setDateFormat:@"dd/MM/YYYY HH:mm:ss"];
    self.printDate=[NSString stringWithFormat:@"%@",[self.format stringFromDate:self.date]];
    
    self.printDate = [_format stringFromDate:self.date];
    
    [self.dateList addObject:self.printDate];
    
    
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Enter Task Name"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter Task Name", @"Text");
     }];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   UITextField *taskName = alertController.textFields.firstObject;
                                   
                                   [self.taskList addObject:taskName.text];
                                   
                                   [self.tableView reloadData];
                                                                                                       }];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
   
}
@end
