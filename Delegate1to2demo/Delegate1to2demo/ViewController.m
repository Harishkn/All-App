//
//  ViewController.m
//  Delegate1to2demo
//
//  Created by test on 6/28/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
- (IBAction)button:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textname;

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

- (IBAction)button:(id)sender
{
    NSString* nme = self.textname.text;
    [self.delegate sendData:nme];
    [self performSegueWithIdentifier:@"segue" sender:self];
}

@end
