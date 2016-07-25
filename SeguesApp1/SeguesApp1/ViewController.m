//
//  ViewController.m
//  SeguesApp1
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "LoginController.h"
#import "RegisterController.h"
#import "AppDelegate.h"

@interface ViewController ()

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
- (IBAction)loginAction:(id)sender
{
    
    self.pwd = self.passwordText.text;
    
    [self performSegueWithIdentifier:@"loginScene" sender:self];
}
- (IBAction)registerAction:(id)sender
{
    [self performSegueWithIdentifier:@"registerScene" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"loginScene"])
    {
        LoginController *lg = [segue destinationViewController];
        NSLog(@"%@",lg);
        
        [lg displayValues:self.nme password:self.pwd];
    }
    
    else if ([segue.identifier isEqualToString:@"registerScene"])
    {
    RegisterController *rc = [segue destinationViewController];
    NSLog(@"%@",rc);
    }
}


@end
