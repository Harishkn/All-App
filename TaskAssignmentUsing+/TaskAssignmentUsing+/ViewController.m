//
//  ViewController.m
//  TaskAssignmentUsing+
//
//  Created by test on 4/30/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.taskNameText.hidden = YES;
    self.saveButton.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveTaskButton:(id)sender
{
    [self performSegueWithIdentifier:@"scene2" sender:self];
}

- (IBAction)createTask:(id)sender
{
    self.taskNameText.hidden=NO;
    self.saveButton.hidden=NO;
}

@end
