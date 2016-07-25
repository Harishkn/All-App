//
//  ViewController.m
//  IOSCaluclatorApplication
//
//  Created by test on 4/16/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *diaplayLabel;

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
- (IBAction)displayButton:(UIButton *)sender
{
    self.diaplayLabel.text = [NSString stringWithFormat:@"%ld",sender.tag];
}

@end
