//
//  ViewController.m
//  ToDoListApp
//
//  Created by test on 4/30/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UITextField *taskNameText;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (strong,nonatomic)NSString* taskName;

@property (strong,nonatomic)NSMutableArray *taskList,*dateArry;

@property (assign,nonatomic)int storeValue;

@property (strong,nonatomic)NSDate* date;

@property (strong,nonatomic)NSDateFormatter *format;

@property(strong,nonatomic)NSString* printDate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.taskNameText.hidden = YES;
    self.saveButton.hidden = YES;
    
    self.taskList = [[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveTask:(id)sender
{
    self.taskNameText.hidden = YES;
    self.saveButton.hidden = YES;
    self.date=[[NSDate alloc]init];
    self.format = [[NSDateFormatter alloc]init];
    
    [self.format setDateFormat:@"dd/MM/YYYY"];
     self.printDate=[NSString stringWithFormat:@"%@",[self.format stringFromDate:self.date]];
    
    _dateArry=[[NSMutableArray alloc]initWithObjects:self.printDate, nil];
            self.taskName = self.taskNameText.text;
    
    //self.taskList = [[NSMutableArray alloc]initWithObjects:self.taskName, nil];
    [self.taskList addObject:self.taskName];
    
   // NSLog(@"%@",self.taskList);
    
    [_tableView reloadData];
}
- (IBAction)addTask:(id)sender
{
    
    
    self.saveButton.hidden = NO;
    self.taskNameText.hidden = NO;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.taskList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.taskList[indexPath.row];
    
   cell.detailTextLabel.text = self.printDate;
    
    //cell.detailTextLabel.text =self.dateArry[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.storeValue = (int)indexPath.row;
    //self.storeValue = (int)[UIColor lightGrayColor];
}
- (IBAction)swipeGesture:(id)sender
{
    [self.taskList removeObjectAtIndex:self.storeValue];
   NSLog(@"right Swipe");
//    NSLog(@"%@",self.taskList);
    
    [self.tableView reloadData];
}
- (IBAction)tapGesture:(id)sender
{
    [self.taskList removeObjectAtIndex:self.storeValue];
    NSLog(@"tap Swipe");
    [self.tableView reloadData];
}
@end
