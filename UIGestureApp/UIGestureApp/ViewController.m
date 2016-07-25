//
//  ViewController.m
//  UIGestureApp
//
//  Created by test on 4/15/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *tapView;

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

- (IBAction)singleTap:(id)sender
{
    self.tapView.frame = CGRectMake(self.tapView.frame.origin.x, self.tapView.frame.origin.y, self.tapView.frame.size.width*2, self.tapView.frame.size.height*2);
}
- (IBAction)doubleTap:(id)sender
{
    self.tapView.frame = CGRectMake(self.tapView.frame.origin.x, self.tapView.frame.origin.y, 100, 100);
}

- (IBAction)swipeRight:(id)sender
{
    self.tapView.frame = CGRectMake(self.tapView.frame.origin.x+10, self.tapView.frame.origin.y, 100, 100);
}
- (IBAction)swipeLeft:(id)sender
{
    self.tapView.frame = CGRectMake(self.tapView.frame.origin.x-10, self.tapView.frame.origin.y, self.tapView.frame.size.width, self.tapView.frame.size.height);
}
- (IBAction)swipeDown:(id)sender
{
    self.tapView.frame = CGRectMake(self.tapView.frame.origin.x, self.tapView.frame.origin.y+10, self.tapView.frame.size.width, self.tapView.frame.size.height);
}
- (IBAction)swipeUp:(id)sender
{
    self.tapView.frame = CGRectMake(self.tapView.frame.origin.x, self.tapView.frame.origin.y-10, self.tapView.frame.size.width, self.tapView.frame.size.height);
}
@end
