//
//  ViewController.m
//  ScroolViewAndTableView
//
//  Created by test on 5/5/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "StudentDataModel.h"
#import "TableViewCell.h"
#import "ViewController2.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *studentName;
@property (weak, nonatomic) IBOutlet UITextField *studentUsn;
@property (weak, nonatomic) IBOutlet UITextField *studentBranch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.studentDataList = [[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitButton:(id)sender
{
    StudentDataModel* model = [[StudentDataModel alloc]initWithName:self.studentName.text usnNumber:self.studentUsn.text studentBranch:self.studentBranch.text];
    
   
    [self.studentDataList addObjectsFromArray:@[model]];
    NSLog(@"%@",self.studentDataList);
    [self performSegueWithIdentifier:@"scene2" sender:self];
    
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *vc2 = [segue destinationViewController];
    
    [vc2 receiveArray:self.studentDataList];
}

@end
