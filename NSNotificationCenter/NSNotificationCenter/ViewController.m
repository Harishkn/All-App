//
//  ViewController.m
//  NSNotificationCenter
//
//  Created by test on 6/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
- (IBAction)getLocation:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveData:) name:@"citiesListComplete" object:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (id) init
//{
//    self = [super init];
//    if (!self) return nil;
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveData:) name:@"citiesListComplete" object:nil];
//     return self;
//}

- (IBAction)getLocation:(id)sender
{
    [self performSegueWithIdentifier:@"scene2" sender:self];
}
-(void)receiveData:(NSNotification*)locationName
{
    NSString* loc = [[locationName userInfo] valueForKey:@"location"];
    
    NSLog(@"Location name %@",[NSString stringWithFormat:@"%@",loc]);
    
    
    self.locationLabel.text = loc;
}
@end
