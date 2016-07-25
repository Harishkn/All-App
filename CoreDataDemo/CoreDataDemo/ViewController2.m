//
//  ViewController2.m
//  CoreDataDemo
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "TableViewCell.h"

@interface ViewController2 ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)NSArray* coreObj;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSManagedObjectContext* context = [self getcontext];
    NSFetchRequest* fetch = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    NSError* error =nil;
    
    
        self.coreObj = [context executeFetchRequest:fetch error:&error];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.coreObj.count ;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
     NSManagedObject* person = self.coreObj[indexPath.row];
    
    cell.nameLbl.text = [person valueForKey:@"name"];
    
    cell.ageLbl.text = [NSString stringWithFormat:@"%@",[person valueForKey:@"age"]];
    
    cell.genderLbl.text = [person valueForKey:@"gender"];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSManagedObjectContext*)getcontext
{
    AppDelegate* app = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext* context = [app managedObjectContext];
    
    return context;
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
