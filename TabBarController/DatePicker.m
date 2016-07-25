//
//  DatePicker.m
//  TabBarController
//
//  Created by test on 4/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "DatePicker.h"

@interface DatePicker ()
@property (weak, nonatomic) IBOutlet UILabel *labelOutlet;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerOutlet;

@property (strong,nonatomic)NSDate* displayDate;

@end

@implementation DatePicker

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)displayTime:(id)sender
{
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    
    [format setDateFormat:@"HH:mm:ss"];
    
    NSString *setDate = [format stringFromDate:self.datePickerOutlet.date];
    
    self.labelOutlet.text = [NSString stringWithFormat:@"Date is %@",setDate];
}
- (IBAction)displayDate:(id)sender
{
    //self.displayDate = self.datePickerOutlet.date;
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    
    [format setDateFormat:@"dd/MM/YYYY"];
    
    NSString *setDate = [format stringFromDate:self.datePickerOutlet.date];
    
    self.labelOutlet.text = [NSString stringWithFormat:@"Time is %@",setDate];
}

@end
