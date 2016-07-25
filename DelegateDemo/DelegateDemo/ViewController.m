//
//  ViewController.m
//  DelegateDemo
//
//  Created by test on 6/28/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()<cutomDelegate>
- (IBAction)submitButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
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


- (IBAction)submitButton:(id)sender
{
    
    
    [self performSegueWithIdentifier:@"scene2" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2* vc = [segue destinationViewController];
    
    vc.delegate = self;
}

-(void)empName:(NSString *)name
{
    self.NameLabel.text = name;
}

@end
