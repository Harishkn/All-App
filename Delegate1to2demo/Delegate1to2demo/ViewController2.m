//
//  ViewController2.m
//  Delegate1to2demo
//
//  Created by test on 6/28/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"
@interface ViewController2 ()<customDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label;

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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController* vc = [segue destinationViewController];
    
    vc.delegate = self;
}


-(void)sendData:(NSString *)name
{
    self.label.text = name;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
