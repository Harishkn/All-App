//
//  ViewController.m
//  TabGame
//
//  Created by test on 4/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textView;
@property (weak, nonatomic) IBOutlet UILabel *labelView;
@property (weak,nonatomic) NSNumber* tabValue,*value;
@property (weak,nonatomic) NSString* tab;
//@property (strong,nonatomic) NSString *inputValue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Do any additional setup after loading the view, typically from a nib.
    self.value = [NSNumber numberWithInt:-1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitButton:(id)sender
{
    self.tab = self.textView.text;
    int i = self.tab.intValue;
    NSLog(@"%d",i);
    self.labelView.text = [NSString stringWithFormat:@"The number of tap required to win is %@",self.tab];
    
    
     //= self.tabValue.intValue;
    
    self.value = [NSNumber numberWithInt:self.value.intValue+1];
   
    NSLog(@"The increment %@",self.value);
    
    if (i == self.value.intValue)
    {
        self.labelView.text = [NSString stringWithFormat:@"win"];
    }
    
}

@end
