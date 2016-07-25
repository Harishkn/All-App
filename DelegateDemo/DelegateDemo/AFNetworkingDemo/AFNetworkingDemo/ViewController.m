//
//  ViewController.m
//  AFNetworkingDemo
//
//  Created by test on 6/29/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()
@property (strong,nonatomic)NSString* helper;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString* reqUrl = @"https://test.aeexchange.com/portal/oauth/token";

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"AEXIOSMOBILE" password:@"tfjhuykvtbkghgn"];
    NSDictionary *parameters = @{@"grant_type":@"client_credentials"};
    
    [manager POST:reqUrl parameters:parameters constructingBodyWithBlock:NULL progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"Token %@",responseObject);
        
        NSError *error;
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];
        
        NSLog(@"Sucess %@",jsonObject);
        if (jsonObject!=nil) {
            
            NSLog(@"Sucess %@",responseObject);
            
        }else
        {
            NSLog(@"Failed");
        }
        
        
        
        //[self.delegate sucessfullRegistration:[jsonDictionary valueForKey:@""]];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //        NSDictionary *userInfo = [error userInfo];
        //        NSData *data = [userInfo objectForKey:@"com.alamofire.serialization.response.error.data"];
        //        NSString * str =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] ;
        
    }];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
