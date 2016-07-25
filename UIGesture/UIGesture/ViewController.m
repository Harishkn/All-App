//
//  ViewController.m
//  UIGesture
//
//  Created by test on 4/15/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

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
- (IBAction)tapGesture:(id)sender
{
    self.label.text = @"Tap Gesture";
}
- (IBAction)pichGesture:(id)sender
{
    self.label.text = @"Pinch gesture";
}


- (IBAction)rotationalGesture:(id)sender
{
    self.label.text = @"Rotation Gesture";
}

- (IBAction)screenEdge:(id)sender
{
    self.label.text = @"screen edge gesture";
}
- (IBAction)longPress:(id)sender
{
    self.label.text = @"long press gesture";
}
- (IBAction)swipeGesture:(id)sender
{
   self.label.text =  @"right sipe";
}
@end
