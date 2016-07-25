//
//  ViewController.m
//  WebView
//
//  Created by test on 4/21/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *web;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
    
    NSURLRequest *request1 = [NSURLRequest requestWithURL:url];
   
   // [self.web loadRequest:request1];
    [[UIApplication sharedApplication]openURL:url];
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activity startAnimating];
    NSLog(@"statrt");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activity stopAnimating];
    [self.activity hidesWhenStopped];
    NSLog(@"stopped");
}

@end
