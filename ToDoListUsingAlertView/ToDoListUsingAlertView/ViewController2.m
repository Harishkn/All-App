//
//  ViewController2.m
//  ToDoListUsingAlertView
//
//  Created by test on 5/2/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong,nonatomic) NSMutableString* string;

@property (strong,nonatomic) NSMutableDictionary* taskDataList;

@property (assign,nonatomic)int receiveData;

@property (strong,nonatomic)NSString* receiveString;
@property (strong,nonatomic)NSString* saveText;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.taskDataList = [[NSMutableDictionary alloc]init];
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
- (IBAction)saveData:(id)sender
{
    //self.saveText = self.textView.text
    if (self.taskDataList == NULL)
    {
        //[self.taskDataList setValue:self.textView.text forKey:self.receiveString];
        NSLog(@"%@",self.textView.text);
        
        [self.taskDataList setValue:self.textView.text forKeyPath:self.receiveString];
        
        _textView.text=[NSString stringWithFormat:@"%@",[self.taskDataList valueForKey:self.receiveString]];
}
//    else{
//        
//        _textView.text=[NSString stringWithFormat:@"%@",[self.taskDataList valueForKey:self.receiveString]];
//        [_textView.text stringByAppendingString:_textView.text];
//        
//        [self.taskDataList setValue:self.textView.text forKey:self.receiveString];
//        
//        
//    }
    
    NSLog(@"%@",self.taskDataList);
     
   // self.textView.text = [self.taskDataList objectForKey:self.receiveString];
    //self.textView.text = [self.taskDataList valueForKey:self.receiveString];
}
-(void)receiveValues:(int)receive
{
    self.receiveData = receive;
}
-(void)receiveStringValue:(NSString*)stringValue;
{
    self.receiveString = stringValue;
    
}

@end
