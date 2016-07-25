//
//  ViewController2.m
//  StudentDataBaseUsingCoreData
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *usnText;
@property (weak, nonatomic) IBOutlet UITextField *ageText;
@property (weak, nonatomic) IBOutlet UITextField *locationText;



@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSManagedObjectContext*)getContext
{
    AppDelegate* app = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext* context = [app managedObjectContext];
    
    return context;
}
- (IBAction)saveButton:(id)sender
{
    NSManagedObjectContext* context = [self getContext];
    
    NSManagedObject *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context];
    
    [student setValue:self.nameText.text forKey:@"name"];
    
    [student setValue:self.usnText.text forKey:@"usn"];
    
    [student setValue:[NSNumber numberWithInt:self.ageText.text.intValue] forKey:@"age"];
    [student setValue:self.locationText.text forKey:@"location"];
    
    NSError* error = 0;
    if( [context save:&error])
    {
        
 [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"Data not saved");
    }
    
   
    
  
}

@end
