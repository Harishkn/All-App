//
//  ViewConroller2.m
//  Segues
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewConroller2.h"

@interface ViewConroller2 ()

@property (strong,nonatomic)NSString* nme;
@property (strong,nonatomic)NSString* pwd;
@end

@implementation ViewConroller2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self displayData:<#(NSString *)#> password:<#(NSString *)#>];
    
   self.nameLabel.text=[NSString stringWithFormat:@"Name is:%@",self.nme];
   self.passwordLabel.text=[NSString stringWithFormat:@"Password is:%@",self.pwd];

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
-(void)displayData:(NSString*)name password:(NSString*)password
{
    self.nme= name;
    self.pwd = password;
    
    if([self.nme isEqualToString: @"harish"] && [self.pwd isEqualToString:@"12345"])
    {
        self.view.backgroundColor = [UIColor greenColor];
        self.nameLabel.text=[NSString stringWithFormat:@"Name is:%@",self.nme];
        self.passwordLabel.text=[NSString stringWithFormat:@"Password is:%@",self.pwd];
        
    }
    else
    {
        self.view.backgroundColor = [UIColor redColor];
        self.nameLabel.text = [NSString stringWithFormat:@"please enter correct details"];
    }
}
- (IBAction)Done:(id)sender
{
    [self performSegueWithIdentifier:@"scene3" sender:self];
}
@end
