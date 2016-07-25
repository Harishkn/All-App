//
//  ViewController.m
//  CustomTableApp2
//
//  Created by test on 4/27/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *genderTextField;
@property (weak, nonatomic) IBOutlet UITextField *countryTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewOutlet;
@property(strong,nonatomic)NSArray* countryList;

@property (strong,nonatomic)NSArray* genderList;

@property (weak, nonatomic) IBOutlet UISwitch *switchOutLet;

@property (strong,nonatomic)NSString* name;
@property (strong,nonatomic)NSString* age;
@property (strong,nonatomic)NSString* gender;
@property (strong,nonatomic)NSString* country;
@property (strong,nonatomic)NSArray* storeData;

@property (assign,nonatomic)BOOL flag;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.flag = 0;
    
    self.countryList = [[NSArray alloc]initWithObjects:@"india",@"uk",@"usa",@"german",@"japan", nil];
    
    self.genderList = [[NSArray alloc]initWithObjects:@"Male",@"Female", nil];
    
    self.pickerViewOutlet.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)NextScene:(id)sender
{
    
    if(self.gender==NULL|| self.country==NULL)
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                       message:@"Please fill the all values."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
    if(self.switchOutLet.isOn)
    {
        self.age = self.ageTextField.text;
        self.name = self.nameTextField.text;
        
        self.storeData = [[NSArray alloc]initWithObjects:self.name,self.age,self.gender,self.country, nil];
        
        [self performSegueWithIdentifier:@"scene2" sender:self];
        
    }
    else
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@" Alert"
                                                                       message:@"Please acceppt Terms and condition"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    }

    
    
  }
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2* vc = [segue destinationViewController];
    
    [vc receiveArray:self.storeData];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.genderTextField)
    {
        self.flag = 0;
        [self.genderTextField resignFirstResponder];
        self.pickerViewOutlet.hidden = NO;
        [self.pickerViewOutlet reloadAllComponents];
    }
    else if(textField == self.countryTextField)
    {
        self.flag =1;
        [self.countryTextField resignFirstResponder];
        self.pickerViewOutlet.hidden = NO;
        [self.pickerViewOutlet reloadAllComponents];
    }
    
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField == self.countryTextField)
    {
        self.pickerViewOutlet.hidden = YES;
    }
    else
    {
        self.pickerViewOutlet.hidden = YES;
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(self.flag == 0)
        return self.genderList.count;
    
    else
    return self.countryList.count;
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(self.flag==0)
    return self.genderList[row];
    else
        return self.countryList[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
        if(self.flag==0)
            self.gender = self.genderList[row];
    
        else
            self.country = self.countryList[row];
    
   
    
    if(self.flag==0)
    self.genderTextField.text = [NSString stringWithFormat:@"%@",self.gender];
    else
    {
    self.countryTextField.text = [NSString stringWithFormat:@"%@",self.country];
    
    }
    
    self.pickerViewOutlet.hidden = YES;
}



@end
