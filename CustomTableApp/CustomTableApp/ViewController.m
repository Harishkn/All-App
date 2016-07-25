//
//  ViewController.m
//  CustomTableApp
//
//  Created by test on 4/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *empNameText;
@property (weak, nonatomic) IBOutlet UITextField *emailIdText;
@property (weak, nonatomic) IBOutlet UITextField *ageText;

@property (weak, nonatomic) IBOutlet UITextField *designationText;
@property (weak, nonatomic) IBOutlet UITextField *locationText;
@property (weak, nonatomic) IBOutlet UIImageView *displayImage;


@property (weak, nonatomic) IBOutlet UITextField *mobileNumberText;

@property (strong,nonatomic) NSString* empNameList;
@property (strong,nonatomic) NSString* emailidList;
@property (strong,nonatomic) NSString* ageList;
@property (strong,nonatomic) NSString* designationList;
@property (strong,nonatomic) NSString* mobileNumberList;
@property (strong,nonatomic) NSString* locationList;
@property (strong,nonatomic) NSString* imageList;
@property (strong,nonatomic) NSString* imageNameList;

@property (strong,nonatomic) NSArray* dataList;

@property (strong,nonatomic)UIImage* image;

@property (strong,nonatomic) NSArray* displayImagelist;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.displayImagelist = [[NSArray alloc]initWithObjects:@"a",@"b",@"c",@"d", nil];
    
    self.displayImage.image = [UIImage imageNamed:@"a"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submit:(id)sender
{
     self.empNameList = self.empNameText.text;
     self.designationList = self.designationText.text;
     self.emailidList = self.emailIdText.text;
     self.ageList = self.ageText.text;
     self.mobileNumberList = self.mobileNumberText.text;
     self.locationList = self.locationText.text;
    
    self.dataList = [[NSArray alloc]initWithObjects:self.empNameList,self.designationList,self.emailidList,self.ageList,self.mobileNumberList,self.locationList, nil];
    self.image = [UIImage imageNamed:@"a"];
    
    [self performSegueWithIdentifier:@"scene2" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *vc2 = [segue destinationViewController];
    
    [vc2 receiveArray:self.dataList];
    
    [vc2 receiveImage:self.image];
}

-(void)displayImage:(UIImage *)imageName
{
    self.image= [UIImage imageNamed:@"a"];
}



@end
