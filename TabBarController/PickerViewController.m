//
//  PickerViewController.m
//  TabBarController
//
//  Created by test on 4/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *displayImageOutlet;
@property (weak, nonatomic) IBOutlet UILabel *displayLabelOutlet;

@property (strong,nonatomic) NSArray* fruitsName;

@property NSInteger saveData;

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.fruitsName = @[@"Orange",@"Banana",@"Mango",@"Pineapple",@"watermelon"];
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

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0)
    {
        return self.fruitsName.count;
    }
    else{
        return 0;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0)
    {
        return self.fruitsName[row];
        
        
    }
    else{
        return @"";
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0)
    {
        self.displayLabelOutlet.text = [NSString stringWithFormat:@"The fruit name is %@",self.fruitsName[row]];
        
        self.saveData = row;
    }
    
    [self displayImage:self.saveData];
}

-(void)displayImage:(NSInteger)getData
{
    if(getData == 0)
    {
        self.displayImageOutlet.image = [UIImage imageNamed:@"orange"];
    }
    else if (getData == 1)
    {
        self.displayImageOutlet.image = [UIImage imageNamed:@"banana"];
    }
    else if (getData == 2)
    {
        self.displayImageOutlet.image = [UIImage imageNamed:@"mango"];
    }
    else if (getData == 3)
    {
        self.displayImageOutlet.image = [UIImage imageNamed:@"pineapple"];
    }
    else if(getData == 4)
    {
        self.displayImageOutlet.image = [UIImage imageNamed:@"watermelon"];
    }
}
@end
