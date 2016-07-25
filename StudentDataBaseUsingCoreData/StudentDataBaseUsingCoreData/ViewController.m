//
//  ViewController.m
//  StudentDataBaseUsingCoreData
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "ViewController2.h"
#import "AppDelegate.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,SecondViewControllerDelegate>


@property(strong,nonatomic)NSArray* coreObj;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSManagedObjectContext* context = [self getContext];
    
    NSFetchRequest* fetch = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    
    NSError* error;
    
    self.coreObj = [context executeFetchRequest:fetch error:&error];
   // [self.tableView reloadData];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.coreObj.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSArray* student1 = self.coreObj[indexPath.row];
    NSLog(@"%@",student1);
    
    
    cell.nameLbl.text = [student1 valueForKey:@"name"];
    cell.usnLbl.text = [student1 valueForKey:@"usn"];
    cell.ageLbl.text = [NSString stringWithFormat:@"%@",[student1 valueForKey:@"age"]];
    cell.locationLbl.text = [student1 valueForKey:@"location"];
    //[self.tableView reloadData];
    return cell;
}
- (IBAction)addStudent:(id)sender
{
    [self performSegueWithIdentifier:@"scene2" sender:self];
}

-(NSManagedObjectContext*)getContext
{
    AppDelegate* app = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext* context = [app managedObjectContext];
    
   // [self.tableView reloadData];
    return context;
}
-(void)dataFromController:(NSString *)data
{
    [self.tableView reloadData];
}
-(void)viewWillAppear:(BOOL)animated
{
    NSManagedObjectContext* context = [self getContext];
    
    NSFetchRequest* fetch = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    
    NSError* error;
    
    self.coreObj = [context executeFetchRequest:fetch error:&error];
    
    [self.tableView reloadData];
}


@end
