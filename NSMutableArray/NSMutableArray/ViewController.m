//
//  ViewController.m
//  NSMutableArray
//
//  Created by test on 4/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameText;


@property (weak, nonatomic) IBOutlet UITextView *diaplayTextView;
@property (strong,nonatomic) NSMutableArray *names;

@property (strong,nonatomic)NSMutableString* str;

@property NSInteger count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.names = [[NSMutableArray alloc]initWithObjects:@"harish",@"bhaskar",@"nadaf",@"raghu", nil];
    self.count=0;
    self.diaplayTextView.text = [NSMutableString stringWithFormat:@"%@\n",self.names];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)displayNamesButton:(id)sender
{
    
    
   if(self.count<4)
   {
       [self.names replaceObjectAtIndex:self.count withObject:self.nameText.text];
   }
   else
   {
       [self.names addObject:self.nameText.text];
     
   }
      self.count++;
    self.diaplayTextView.text = [NSString stringWithFormat:@"%@\n",self.names];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


@end
