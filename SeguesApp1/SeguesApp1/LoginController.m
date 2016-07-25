//
//  LoginController.m
//  SeguesApp1
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "LoginController.h"
#import "RegisterController.h"

@interface LoginController ()

@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic)NSString *password;
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//self.displayName.text = @"Meheboob";
    
    
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
-(void)displayValues:(NSString*)nmeText password:(NSString*)pwdText
{
    self.displayName.text = @"harish";
    self.displayPassword.text = @"Welcome";
    
    self.name = nmeText;
    self.password = pwdText;
    
           // self.displayName.text = [NSString stringWithFormat:@"Name is %@",self.name];
        
        NSLog(@"log1 ");
       // NSLog(@"Password %@",self.password);
}
@end
