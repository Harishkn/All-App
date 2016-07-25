//
//  ViewController.m
//  Segues
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewConroller2.h"
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
- (IBAction)passData:(id)sender
{
    //self.nameStr = self.name.text;
  //  self.passStr = self.password.text;
    
    
    
    
    [self performSegueWithIdentifier:@"scene2" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   ViewConroller2 *vc = [segue destinationViewController];
    
    [vc displayData:self.nameStr password:self.passStr];
}

@end
