//
//  ViewController.m
//  ToDoListUsingCoreData
//
//  Created by test on 5/10/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(strong,nonatomic)NSDate* date;

@property(strong,nonatomic)NSDateFormatter* format;

@property(strong,nonatomic)NSMutableArray* dateList,*displayItems;
@property(strong,nonatomic)NSString* printDate;

@property(strong,nonatomic)NSIndexPath* selectedpath;

@property(strong,nonatomic)NSArray* task;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.displayItems = [[NSMutableArray alloc]init];
    [self fetchData];

}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    if ([searchText length]==0)
    {
        [self.displayItems removeAllObjects];
        [self.displayItems addObjectsFromArray:self.taskList];
       // [self.tableView reloadData];
    }
    else
    {
        [self.displayItems removeAllObjects];
        for (NSString *str in self.taskList)
        {
            NSRange r = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if(r.location!=NSNotFound)
            {
                [self.displayItems addObject:str];
            }
        }
        //[self.tableView reloadData];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)swipeLeft:(id)sender
{
    CGPoint loc=[sender locationInView:self.tableView];
    self.selectedpath = [self.tableView indexPathForRowAtPoint:loc];
    TableViewCell* cell = [self.tableView cellForRowAtIndexPath:self.selectedpath];
    cell.editOutlet.hidden=NO;
    cell.deleteOutlet.hidden=NO;
}
- (IBAction)addTask:(id)sender
{
    
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
                                   
                                   NSManagedObjectContext* context = [self getContext];
                                   
                                   NSManagedObject* task = [NSEntityDescription insertNewObjectForEntityForName:@"Todolist" inManagedObjectContext:context];
                                   [task setValue:taskName.text forKey:@"taskname"];
                                  [task setValue:self.printDate forKey:@"date"];
                                   
                                   
                                   
                                   
                                   NSError* error = nil;
                                   if([context save:&error])
                                   {
                                       NSLog(@"saved data done");
                                       [self fetchData];
                                   }
                                   else{
                                       NSLog(@"failed to save data %@",error.localizedDescription);
                                   }
                                   
                                   [self.tableView reloadData];
                                   
                               }];
    
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    [self.tableView reloadData];
}

-(NSManagedObjectContext*)getContext
{
    AppDelegate* app = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext* context = [app managedObjectContext];
    
    return context;
}

- (IBAction)deleteData:(UIButton*)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(TableViewCell *)sender.superview.superview];
    
    NSManagedObjectContext *context=[self getContext];
    [context deleteObject:[self.taskList objectAtIndex:indexPath.row]];
    NSError* error=nil;
    [context save:&error];
    
    [self.taskList removeObjectAtIndex:indexPath.row];
    TableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.editOutlet.hidden=YES;
    cell.deleteOutlet.hidden=YES;
    [self.tableView reloadData];

}
- (IBAction)editData:(UIButton*)sender
{
    NSManagedObject* model = self.taskList[self.selectedpath.row];
    
    
    
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
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:(TableViewCell *)sender.superview.superview];
        
                                   [model setValue:taskName.text forKey:@"taskname"];
                                   [model setValue:self.printDate forKey:@"date"];
        
        NSManagedObjectContext* context=[self getContext];
        NSError* error=nil;
        [context save:&error];
        
        
        //        EmpolyeeModel* model = [[EmpolyeeModel alloc] initWithName:name.text Designation:des.text];
        //        [self.modelObjects replaceObjectAtIndex:indexPath.row withObject:model];
        TableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
        cell.editOutlet.hidden=YES;
        cell.deleteOutlet.hidden=YES;
                                   
        [self fetchData];
        [self.tableView reloadData];
        
        
        
    }];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
- (IBAction)swipeRight:(id)sender
{
    CGPoint location=[sender locationInView:self.tableView];
    NSIndexPath* path = [self.tableView indexPathForRowAtPoint:location];
    TableViewCell* cell = [self.tableView cellForRowAtIndexPath:path];
    cell.editOutlet.hidden=YES;
    cell.deleteOutlet.hidden=YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.displayItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSManagedObject *model=self.taskList[indexPath.row];
    
    cell.taskNameLbl.text=[model valueForKey:@"taskname"];
   cell.timeLbl.text=[model valueForKey:@"date"];
    return cell;
}
-(void)fetchData{
    
    NSManagedObjectContext* context=[self getContext];
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"Todolist"];
    NSError* error=nil;
    
    self.taskList=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    
    self.displayItems = self.taskList;
    
    NSLog(@"%@",self.displayItems);
    
   // [self.tableView reloadData];
       // [self.taskList addObjectsFromArray:self.task];
   // NSLog(@"%@",[NSString stringWithFormat:@"%@",self.taskList]);
}

@end
