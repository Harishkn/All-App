//
//  ViewController.m
//  UISegmentdViewAndSwitch
//
//  Created by test on 4/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UISwitch *switchOutlet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.segmentedControl.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)segmentAction:(id)sender
{
    if(self.segmentedControl.selectedSegmentIndex == 0)
    {
        self.view.backgroundColor = [UIColor blueColor];
    }
    else if(self.segmentedControl.selectedSegmentIndex == 1)
    {
        self.view.backgroundColor = [UIColor redColor];
    }
    else if(self.segmentedControl.selectedSegmentIndex==2)
    {
        self.view.backgroundColor = [UIColor orangeColor];
    }
}
- (IBAction)switchAction:(id)sender
{
    if (self.switchOutlet.isOn)
    {
        self.segmentedControl.hidden = NO;
    }
    else
    {
        self.segmentedControl.hidden = YES;
    }
}

@end
