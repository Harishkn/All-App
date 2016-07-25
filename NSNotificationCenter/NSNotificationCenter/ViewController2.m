//
//  ViewController2.m
//  NSNotificationCenter
//
//  Created by test on 6/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UIButton *submitData;
- (IBAction)submitLocation:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property(strong,nonatomic)NSDictionary* locationDict;
@property(strong,nonatomic)NSString* location;
@end

@implementation ViewController2

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

- (IBAction)submitLocation:(id)sender
{
    self.location = self.locationTextField.text;
    
    self.locationDict = [NSDictionary dictionaryWithObject:self.location forKey:@"location"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"citiesListComplete" object:nil userInfo:self.locationDict];
    
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
