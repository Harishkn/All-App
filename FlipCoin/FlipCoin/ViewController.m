//
//  ViewController.m
//  FlipCoin
//
//  Created by test on 4/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *diaplayText;

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.displayLabel.text = [NSString stringWithFormat:@"Enter head r tail to win the game"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)checkButton:(id)sender
{
    int rand;
   rand = arc4random_uniform(2);
    NSLog(@"The generated random numbers are %d",rand);
    
    if(rand == 0)
    {
       // self.displayLabel.text = [NSString stringWithFormat:@"Congrats you won the game"];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Your Result is" message:[NSString stringWithFormat:@"Congrats you won"] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Your Result is" message:[NSString stringWithFormat:@"Sorry Better luck next time"] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];

    }
    
    
    
}

@end
