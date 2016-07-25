//
//  ViewController.m
//  FindingAgeDatePicker
//
//  Created by test on 5/24/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *dateOfBirth;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *currentAge;
- (IBAction)getAge:(id)sender;
@property (strong,nonatomic)NSDate *gotdate;
@property(strong,nonatomic)NSString* current;
@property(strong,nonatomic)NSString* dob;
@property(assign,nonatomic)int store;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.gotdate = self.datePicker.date;
    
    self.current = [NSString stringWithFormat:@"%@",self.gotdate];
    
    // self.showDate.text =[NSString stringWithFormat:@"%@",gotdate];
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    
    [format setDateFormat:@"dd/MM/YYYY"];
    
    self.currentAge.text = [NSString stringWithFormat:@"%@",[format stringFromDate:self.gotdate]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getAge:(id)sender
{
    self.gotdate = self.datePicker.date;
    
    self.dob = [NSString stringWithFormat:@"%@",self.datePicker.date];
    // self.showDate.text =[NSString stringWithFormat:@"%@",gotdate];
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    
    [format setDateFormat:@"dd/MM/YYYY"];
    
    self.dateOfBirth.text = [NSString stringWithFormat:@"%@",[format stringFromDate:self.gotdate]];
    
    self.store = (self.current.intValue-self.dob.intValue);
    
    
    self.age.text = [NSString stringWithFormat:@"%d",self.store];
    
    
    
    }

@end
