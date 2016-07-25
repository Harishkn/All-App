//
//  LoginViewController.m
//  StudentDataBase
//
//  Created by test on 5/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "LoginViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameText;
- (IBAction)LoginButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@property(strong,nonatomic)NSMutableArray* taskList;
@property(strong,nonatomic)NSMutableArray* employeeIDs;
@property(strong,nonatomic)NSString* name;
@property(assign,nonatomic)NSString* password;
@property(strong,nonatomic)NSMutableArray* allnames;
@property(assign,nonatomic)int pass;
@property(strong,nonatomic)NSDictionary* allValues;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self fetchData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fetchData
{
    
    NSManagedObjectContext* context=[self getContext];
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"Users"];
    NSError* error=nil;
    
    self.taskList=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    
   
    
   
    
    req.resultType = NSDictionaryResultType;
    
    [req setPropertiesToFetch:[NSArray arrayWithObjects:@"name", @"password",nil]];
    
        NSArray *results    = [context executeFetchRequest:req
error:&error];
    
  self.allnames = [[NSMutableArray alloc]init];
  self.employeeIDs = [[NSMutableArray alloc]init];
    
   self.employeeIDs = [results valueForKey:@"name"];
    self.allnames = [results valueForKey:@"password"];
    
    
    self.allValues = [[NSDictionary alloc]initWithObjects:self.employeeIDs forKeys:self.allnames];
    
//   NSLog(@"%@",_employeeIDs);
//    NSLog(@"%@",self.allnames);
    NSLog(@"%@",self.allValues);
    NSLog(@"inside fetch %@",[self.allValues valueForKey:@"111"]);
}
-(NSManagedObjectContext*)getContext
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

- (IBAction)LoginButton:(id)sender
{
        [self fetchData];
    self.name = self.nameText.text;
    self.password = self.passwordText.text;

//    for (NSString* values in self.allValues)
//    {
//        if (([self.name isEqualToString:values]) && ([self.password isEqualToString:values]))
//        {
//            NSLog(@"%@",values);
//
//
//        }
//    }
    
    //NSLog(@"%@",[self.allValues valueForKey:self.name]);
    if ([[self.allValues valueForKey:self.passwordText.text] isEqualToString:_nameText.text]) {
        
        [self performSegueWithIdentifier:@"displaydata" sender:self];
        
    }
    else
    {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Sorry Boss" message:@"You have entered invalid credentials" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *OK=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:OK];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}
@end
