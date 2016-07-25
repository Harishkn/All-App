//
//  ViewController2.m
//  AFNetworkingDemo2
//
//  Created by test on 6/30/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController2.h"
#import <AFNetworking.h>

@interface ViewController2 ()
@property (strong,nonatomic)NSDictionary* apidict;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)apiDictionary
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=a3ce7967a5ff4216bd555247160406&q=Bangalore&format=json&num_of_days=5" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        //NSLog(@"%@",responseObject);
        self.apidict = responseObject;
         [self.delegate sessionManager:_apidict];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Failure");
    }];
    
    
    

   
}

@end
