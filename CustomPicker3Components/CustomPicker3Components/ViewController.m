//
//  ViewController.m
//  CustomPicker3Components
//
//  Created by test on 4/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *displayImage;
@property (weak, nonatomic) IBOutlet UILabel *empIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *empNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *empDesgLabel;

@property (strong,nonatomic) NSArray* Eid;

@property (strong,nonatomic)NSArray* Ename;

@property (strong,nonatomic)NSArray* Edesignation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.Eid = @[@"150",@"151",@"152",@"153",@"154"];
    
    self.Ename = @[@"Harish",@"Bhaskar",@"Nadaf",@"Raghu",@"Sameer"];
    
    self.Edesignation=@[@"officeboy",@"MD",@"TL",@"Manager",@"teaBoy"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component==0)
       {
         return self.Eid.count;
       }
    else if (component==1)
    {
        return self.Ename.count;
    }
    else if(component==2)
    {
        return self.Edesignation.count;
    }
    else
    {
        return 0;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component==0)
    {
        return self.Eid[row];
    }
    else if (component==1)
    {
        return self.Ename[row];
    }
    else if (component==2)
    {
        return self.Edesignation[row];
    }
    else
    {
            return @"";
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component==0)
    {
        self.empIdLabel.text =[NSString stringWithFormat:@"The Eid is %@",self.Eid[row]];
    }
    else if (component==1)
    {
        self.empNameLabel.text = [NSString stringWithFormat:@"The employee name is %@",self.Ename[row]];
    }
    else if (component==2)
    {
        self.empDesgLabel.text = [NSString stringWithFormat:@"The designation is %@",self.Edesignation[row]];
    }
}
@end
