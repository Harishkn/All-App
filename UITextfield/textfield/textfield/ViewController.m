//
//  ViewController.m
//  textfield
//
//  Created by test on 4/1/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    NSString *username;
   NSString *password;
    
    NSDictionary *loginData;
}

@property (weak, nonatomic) IBOutlet UITextField *usernametextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordtextfield;
- (IBAction)clearbutton:(id)sender;

- (IBAction)Loginbutton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *displaylabel;
@property (weak, nonatomic) IBOutlet UITextField *displaytextfield;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    loginData = [[NSDictionary alloc]initWithObjectsAndKeys:@"harish",@"hari", nil];
    
    loginData = [NSDictionary dictionaryWithObjectsAndKeys:@"hari",@"111", nil];
    
    
    
}
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    NSLog(@"textFieldShouldBeginEditing");
//
//    return YES;
//}
//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    NSLog(@"The text field begin editing");
//}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"The text field did ending");
    if (textField == self.usernametextfield) {
        
    
    username = _usernametextfield.text;
        [textField resignFirstResponder];
        [self.view resignFirstResponder];
    }else{
    password = _passwordtextfield.text;
        [textField resignFirstResponder];
        [self.view resignFirstResponder];
        

    }
    }
//- (BOOL)textFieldShouldClear:(UITextField *)textField
//{
//     NSLog(@"textFieldShouldClear");
//    return NO;
//// called when clear button pressed. return NO to ignore (no notifications)
//}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // called when 'return' key pressed. return NO to ignore.
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearbutton:(id)sender
{
_usernametextfield.text = @"";
    _passwordtextfield.text = @"";
    username = @"";
    password = @"";
}

- (IBAction)Loginbutton:(id)sender
{
    [_passwordtextfield resignFirstResponder];
    if([_passwordtextfield.text isEqualToString:[loginData objectForKey:_passwordtextfield.text]])
    {
        _displaylabel.text = @"Hello You are welcome";
    }
    else{
        _displaylabel.text = @"Hello You are  not welcome";
    }
    
//    if([username isEqualToString:@"harish"] && [password isEqualToString:@"harish"])
//    {
//        _displaylabel.text = @"Hello You are welcome";
//    }
//    else
//    {
//        _displaylabel.text = @"Hello you are not welcome";
//    }

}
@end
