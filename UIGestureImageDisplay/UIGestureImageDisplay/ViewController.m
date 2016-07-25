//
//  ViewController.m
//  UIGestureImageDisplay
//
//  Created by test on 4/15/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *displayImage;

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@property (strong,nonatomic) NSArray* imageList;

@property(strong,nonatomic)NSArray* labelList;

@property(assign,nonatomic)int i;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _imageList = [NSArray arrayWithObjects:[UIImage imageNamed:@"one"],[UIImage imageNamed:@"two"],[UIImage imageNamed:@"three"],[UIImage imageNamed:@"four"],[UIImage imageNamed:@"five"], nil];
    
    _labelList = [NSArray arrayWithObjects:@"Mango",@"orange",@"watermelon",@"pineapple",@"banana", nil];
    
    self.i = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipeRight:(id)sender
{
    self.displayImage.image = [self.imageList objectAtIndex:self.i];
    
   
    
   if([self.imageList count]==5)
    {
        self.i = 0;
    }
     self.i++;
    
}
- (IBAction)swipeLeft:(id)sender
{
    self.displayLabel.text = [self.labelList objectAtIndex:self.i];
    
    
    self.i++;
    if([self.labelList count]==4)
    {
        self.i = 0;
    }
    
    

}
@end
