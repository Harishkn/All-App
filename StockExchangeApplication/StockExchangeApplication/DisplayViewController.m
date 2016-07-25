//
//  DisplayViewController.m
//  StockExchangeApplication
//
//  Created by test on 7/19/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeStamp;
@property (weak, nonatomic) IBOutlet UILabel *volume;
@property (weak, nonatomic) IBOutlet UILabel *symbol;
@property (weak, nonatomic) IBOutlet UILabel *high;
@property (weak, nonatomic) IBOutlet UILabel *low;
@property (weak, nonatomic) IBOutlet UILabel *lastPrice;
@property (weak, nonatomic) IBOutlet UILabel *netChange;
@property (weak, nonatomic) IBOutlet UILabel *percentage;
@property (weak, nonatomic) IBOutlet UILabel *exchange;
@property(strong,nonatomic)NSDictionary* json;
@property (weak, nonatomic) IBOutlet UILabel *close;
@property(strong,nonatomic)NSArray* allResults;
@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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

-(void)receiveData:(NSString*)locationName
{
    NSString* location = locationName;
    
    
    NSLog(@"Location is %@",location);
    NSString* newUrl = [NSString stringWithFormat:@"http://marketdata.websol.barchart.com/getQuote.json?key=7a9e8fc2aa594e4e80a7d8c245cf1737&symbols=%@",location];
    NSLog(@"new url %@",newUrl);
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:newUrl] completionHandler:^(NSData *data,NSURLResponse* response,NSError* error)
        {
        self.json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",[_json valueForKey:@"results"]);
            
          dispatch_async(dispatch_get_main_queue(), ^{
              
         
    self.allResults = [self.json valueForKey:@"results"];
                                          
    self.symbol.text = [[self.allResults valueForKey:@"symbol"]componentsJoinedByString:@""];
            
    NSLog(@"%@",[[self.allResults valueForKey:@"symbol"]componentsJoinedByString:@""]);
                                          
    self.volume.text = [[self.allResults valueForKey:@"volume"]componentsJoinedByString:@""];
                                          
    self.timeStamp.text = [[self.allResults valueForKey:@"tradeTimestamp"]componentsJoinedByString:@""];
    self.close.text = [[self.allResults valueForKey:@"close"]componentsJoinedByString:@""];
    
    self.high.text = [[self.allResults valueForKey:@"high"]componentsJoinedByString:@""];
              
    self.low.text = [[self.allResults valueForKey:@"low"]componentsJoinedByString:@""];
              
    self.lastPrice.text = [[self.allResults valueForKey:@"lastPrice"]componentsJoinedByString:@""];
              
    self.netChange.text = [[self.allResults valueForKey:@"netChange"]componentsJoinedByString:@""];
              
    self.exchange.text = [[self.allResults valueForKey:@"exchange"]componentsJoinedByString:@""];
    });
}];
    [dataTask resume];
    
    
    
}


@end
