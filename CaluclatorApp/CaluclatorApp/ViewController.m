//
//  ViewController.m
//  CaluclatorApp
//
//  Created by test on 4/16/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (assign,nonatomic) NSNumber *num1;
@property (assign,nonatomic) NSNumber *temp;
@property (strong,nonatomic) NSString *fun;
@property (strong,nonatomic)NSMutableString * stringval;
@property (strong,nonatomic)NSNumber *num2;

@property(strong,nonatomic)NSString *firstnum;
@property(strong,nonatomic)NSString *secondnum;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.stringval = [[NSMutableString alloc]init];
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)inputButton:(UIButton *)sender
{
   if (sender.tag == 10||sender.tag == 20 || sender.tag == 30 || sender.tag == 40 || sender.tag == 50 || sender.tag==60)
   {
       
   }
   else{
    //self.displayLabel.text= [NSString stringWithFormat:@"%ld",sender.tag];
       
       NSString *incomingNo=[NSString stringWithFormat:@"%ld",sender.tag];
//       self.displayLabel.text=incomingNo;
       self.displayLabel.text=[self.displayLabel.text stringByAppendingString:incomingNo];
       
   }
    if (sender.tag == 10||sender.tag == 20 || sender.tag == 30 || sender.tag == 40 || sender.tag == 50 || sender.tag==60)
    {
        if(sender.tag == 60)
        {
            if(self.temp != nil && self.num1 != nil)
            {
                [self performFunctionality:self.fun];
            }
            
        }
        else if(sender.tag == 10)
        {
            [self clearData];
        }
        else
        {
            [self decideFunc:sender.tag];
            
            self.displayLabel.text=@" ";
            
            self.temp = self.num1;
            
            self.num1 = nil;
        }
        
        
    }
    else
    {
       // self.stringval = [[NSString alloc]init];
        self.num1 = [NSNumber numberWithInt:self.displayLabel.text.intValue];
        
        
        
        
        
    }
}
-(void)performFunctionality:(NSString *)functionality
{
    if([functionality isEqualToString:@"add"])
    {
        int outputvalue = self.temp.intValue + self.num1.intValue;
        
        [self clearData];

        self.displayLabel.text = [NSString stringWithFormat:@"%d",outputvalue];
        
        self.num1=[NSNumber numberWithInteger:self.displayLabel.text.integerValue];
       // NSLog(@"%d",outputvalue);
        
    }
    else if ([functionality isEqualToString:@"sub"])
    {
        int outputval = self.temp.intValue - self.num1.intValue;
        [self clearData];
        self.displayLabel.text = [NSString stringWithFormat:@"%d",outputval];
          self.num1=[NSNumber numberWithInteger:self.displayLabel.text.integerValue];
        
       
    }
    else if ([functionality isEqualToString:@"divide"])
    {
        int outputval = self.temp.intValue / self.num1.intValue;
        [self clearData];
        self.displayLabel.text = [NSString stringWithFormat:@"%d",outputval];
       self.num1=[NSNumber numberWithInteger:self.displayLabel.text.integerValue];
        
        
       
    }
    else if ([functionality isEqualToString:@"mul"])
    {
        int outputval = self.temp.intValue * self.num1.intValue;
        [self clearData];

        self.displayLabel.text = [NSString stringWithFormat:@"%d",outputval];
          self.num1=[NSNumber numberWithInteger:self.displayLabel.text.integerValue];
               //self.num1 = nil;
    }
    
}
-(void)decideFunc:(NSInteger)tags
{
    switch (tags) {
        case 20:
            self.fun=@"sub";
            break;
        case 30:
            self.fun =@"add";
            break;
            case 40:
            self.fun = @"divide";
            break;
            case 50:
            self.fun = @"mul";
            break;
        default:
            break;
    }
}

-(void)clearData
{
    self.displayLabel.text = @" ";
    self.temp = nil;
    self.num1 = nil;
}

@end
