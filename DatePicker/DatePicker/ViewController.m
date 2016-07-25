//
//  ViewController.m
//  DatePicker
//
//  Created by test on 4/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

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
- (IBAction)getDate:(id)sender
{
    
    
    NSDate *gotdate = self.datePicker.date;
    
   // self.showDate.text =[NSString stringWithFormat:@"%@",gotdate];
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    
    [format setDateFormat:@"dd/MM/YYYY"];
    
    self.showDate.text = [NSString stringWithFormat:@"%@",[format stringFromDate:gotdate]];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Todays Date is" message:[format stringFromDate:gotdate] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
   }
- (IBAction)detTime:(id)sender
{
    NSDate *gotTime = self.datePicker.date;
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"HH:mm:ss"];
    
    self.showDate.text = [NSString stringWithFormat:@"%@",[format stringFromDate:gotTime]];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Current Time is" message:[format stringFromDate:gotTime] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];

    
}


@end
