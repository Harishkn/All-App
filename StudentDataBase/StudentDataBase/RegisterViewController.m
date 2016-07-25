//
//  RegisterViewController.m
//  StudentDataBase
//
//  Created by test on 5/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "RegisterViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface RegisterViewController ()
- (IBAction)registerButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userAge;
@property (weak, nonatomic) IBOutlet UITextField *userEmail;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;

@property(strong,nonatomic)NSIndexPath* selectedpath;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registerButton:(id)sender
{
    NSManagedObjectContext* context = [self getContext];
    
    NSManagedObject* task = [NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:context];
    [task setValue:self.userName.text forKey:@"name"];
    [task setValue:[NSNumber numberWithInt:self.userAge.text.intValue] forKey:@"age"];
    [task setValue:self.userEmail.text forKey:@"email"];
    [task setValue:self.userPassword.text forKey:@"password"];
    
    NSError* error = nil;
    if([context save:&error])
    {
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Thank you for registering"
                                              message:@"Go back and Login"
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action){}];

        
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
       
    }
    else{
        NSLog(@"failed to save data %@",error.localizedDescription);
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Registration failed"
                                              message:@"Please enter correct data"
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action){}];
        
        
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];

    }
    

}
-(NSManagedObjectContext*)getContext
{
    AppDelegate* app = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext* context = [app managedObjectContext];
    
    return context;
}
@end
