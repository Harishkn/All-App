//
//  ViewController.m
//  TabBarController
//
//  Created by test on 4/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedOutLet;
@property (weak, nonatomic) IBOutlet UISwitch *switchOutLet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.segmentedOutLet.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)segmentedAction:(id)sender
{
    if (self.segmentedOutLet.selectedSegmentIndex == 0)
    {
        self.view.backgroundColor = [UIColor purpleColor];
    }
    else if (self.segmentedOutLet.selectedSegmentIndex == 1)
    {
        self.view.backgroundColor = [UIColor orangeColor];
    }
    else if (self.segmentedOutLet.selectedSegmentIndex == 2)
    {
        self.view.backgroundColor = [UIColor yellowColor];
    }
    
}
- (IBAction)switchAction:(id)sender
{
    if(self.switchOutLet.isOn)
    {
        self.segmentedOutLet.hidden = NO;
    }
    else
    {
        self.segmentedOutLet.hidden = YES;
    }
}

@end
