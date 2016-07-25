//
//  AlertViewController.m
//  TabBarController
//
//  Created by test on 4/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextOutLet;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextOutlet;
@property (strong,nonatomic) NSString* name;

@property (strong,nonatomic) NSString* password;
@end

@implementation AlertViewController

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
- (IBAction)loginButtonAction:(id)sender
{
    self.name = self.usernameTextOutLet.text;
    
    self.password = self.passwordTextOutlet.text;
    if([self.name isEqualToString:@"harish"] && [self.password isEqualToString:@"12345"])
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@" Alert"
                                                                       message:@"Login success fully Welcome"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Fail Alert"
                                                                       message:@"Login unsuccesfull"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
