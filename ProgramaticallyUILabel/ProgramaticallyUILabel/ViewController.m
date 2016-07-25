//
//  ViewController.m
//  ProgramaticallyUILabel
//
//  Created by test on 5/25/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label;
    UILabel *label2;
    label=[[UILabel alloc]initWithFrame:CGRectMake(10, 100, 100, 100)];//Set frame of label in your viewcontroller.
    [label setBackgroundColor:[UIColor lightGrayColor]];//Set background color of label.
    [label setText:@"Welcome"];//Set text in label.
    [label setTextColor:[UIColor blackColor]];//Set text color in label.
    [label setTextAlignment:NSTextAlignmentCenter];//Set text alignment in label.
    [label setBaselineAdjustment:UIBaselineAdjustmentAlignBaselines];//Set line adjustment.
    [label setLineBreakMode:NSLineBreakByCharWrapping];//Set linebreaking mode..
    [label setNumberOfLines:1];//Set number of lines in label.
    [label.layer setCornerRadius:25.0];//Set corner radius of label to change the shape.
    [label.layer setBorderWidth:2.0f];//Set border width of label.
    [label setClipsToBounds:YES];//Set its to YES for Corner radius to work.
    [label.layer setBorderColor:[UIColor blackColor].CGColor];//Set Border color.
    [self.view addSubview:label];//Add it to the view of your choice.
    label2=[[UILabel alloc]initWithFrame:CGRectMake(150, 100, 100, 100)];//Set frame of label in your viewcontroller.
    [label2 setBackgroundColor:[UIColor lightGrayColor]];//Set background color of label.
    [label2 setText:@"Welcome"];//Set text in label.
    [label2 setTextColor:[UIColor blackColor]];//Set text color in label.
    [label2 setTextAlignment:NSTextAlignmentCenter];//Set text alignment in label.
    [label2 setBaselineAdjustment:UIBaselineAdjustmentAlignBaselines];//Set line adjustment.
    [label2 setLineBreakMode:NSLineBreakByCharWrapping];//Set linebreaking mode..
    [label2 setNumberOfLines:1];//Set number of lines in label.
    [label2.layer setCornerRadius:25.0];//Set corner radius of label to change the shape.
    [label2.layer setBorderWidth:2.0f];//Set border width of label.
    [label2 setClipsToBounds:YES];//Set its to YES for Corner radius to work.
    [label2.layer setBorderColor:[UIColor blackColor].CGColor];//Set Border color.
    [self.view addSubview:label2];//Add it to the view of your choice.


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
