//
//  ViewController.m
//  AFNetworkingDemo2
//
//  Created by test on 6/30/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "ViewController2.h"


@interface ViewController ()<customDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ViewController2* vc = [[ViewController2 alloc]init];
    vc.delegate=self;
    [vc apiDictionary];

   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sessionManager:(NSDictionary *)apiDictionary
{
    NSDictionary* dict = apiDictionary;
    NSLog(@"%@",dict);
}
@end
