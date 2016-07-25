//
//  ViewController.m
//  CoreDataDemo
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *ageText;
@property (weak, nonatomic) IBOutlet UITextField *genderText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
    
    NSManagedObject* person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    
    [person setValue:self.nameText.text forKey:@"name"];
    [person setValue:[NSNumber numberWithInt:self.ageText.text.intValue] forKey:@"age"];
    [person setValue:self.genderText.text forKey:@"gender"];
    
    NSError* error = nil;
    if([context save:&error])
    {
        NSLog(@"saved data done");

    }
    else{
              NSLog(@"failed to save data %@",error.localizedDescription);
    }
    
}
- (IBAction)viewCoreData:(id)sender
{
    [self performSegueWithIdentifier:@"scene2" sender:self];
}


@end
