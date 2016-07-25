//
//  ViewController.m
//  UiButton
//
//  Created by test on 4/1/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    NSArray *colors;
    
    int i;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    i=0;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitbutton:(id)sender
{
    colors = [[NSArray alloc]initWithObjects:[UIColor blueColor],[UIColor redColor],[UIColor greenColor], nil];
    
    
    self.view.backgroundColor = [colors objectAtIndex:i];
    i++;
    
    
    switch (i) {
        case 1:
            [_colorNameLabel setText:@"Blue"];
            [_colorNameLabel setTextColor:[UIColor blueColor]];
            break;
            case 2:
            [_colorNameLabel setText:@"red"];
            [_colorNameLabel setTextColor:[UIColor redColor]];
            break;
            case 3:
            [_colorNameLabel setText:@"green"];
            [_colorNameLabel setTextColor:[UIColor greenColor]];
            break;
            
            
        default:
            break;
    }
    if(i==[colors count])
    {
        i=0;
    }

   }
- (IBAction)submitpreviousbutton:(id)sender
{
     colors = [[NSArray alloc]initWithObjects:[UIColor blueColor],[UIColor redColor],[UIColor greenColor], nil];
    
    self.view.backgroundColor = [colors objectAtIndex:i];
    i++;
    switch (i) {
        case 1:
            [_colorNameLabel setText:@"Blue"];
            [_colorNameLabel setTextColor:[UIColor blueColor]];
            break;
        case 2:
            [_colorNameLabel setText:@"red"];
            [_colorNameLabel setTextColor:[UIColor redColor]];
            break;
        case 3:
            [_colorNameLabel setText:@"green"];
            [_colorNameLabel setTextColor:[UIColor greenColor]];
            break;
            
            
        default:
            break;
    }
    if(i==[colors count])
    {
        i =0;
    }


}
@end
