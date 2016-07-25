//
//  ViewController.m
//  StockExchangeApplication
//
//  Created by test on 7/19/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewDisplay;
@property(strong,nonatomic)NSDictionary* json;
@property(strong,nonatomic)NSMutableArray* companyNames;
@property(strong,nonatomic)NSString* selectedData;
@property(strong,nonatomic)NSDictionary* selectedDict;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    
    self.companyNames = [[NSMutableArray alloc]init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveData:) name:@"citiesListComplete" object:nil];
    
    
    
    [self downloadDataFromApi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.companyNames.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",[self.companyNames valueForKey:@"symbol"][indexPath.row]];
    
    cell.stockValue.text = [NSString stringWithFormat:@"%@",[self.companyNames valueForKey:@"lastPrice"][indexPath.row]];
    
    cell.stockRate.text = [NSString stringWithFormat:@"%@",[self.companyNames valueForKey:@"percentChange"][indexPath.row]];
    cell.volume.text = [NSString stringWithFormat:@"%@",[self.companyNames valueForKey:@"volume"][indexPath.row]];


    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    TableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    self.selectedData = selectedCell.nameLabel.text;
    
      [self performSegueWithIdentifier:@"display" sender:self];

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"display"])
    {
    DisplayViewController* dvc = [segue destinationViewController];
    
    [dvc receiveData:self.selectedData];
    }
}
-(void)downloadDataFromApi
{
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://marketdata.websol.barchart.com/getQuote.json?key=7a9e8fc2aa594e4e80a7d8c245cf1737&symbols=ZC*1,IBM,GOOGL"] completionHandler:^(NSData *data,NSURLResponse* response,NSError* error)
    {
        self.json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.companyNames= [self.json valueForKey:@"results"];
        
         NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.companyNames forKey:@"savedValues"];
        [defaults synchronize];
        
        NSLog(@"%@",[self.companyNames valueForKey:@"symbol"]);
        
    dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableViewDisplay reloadData];
    });
                                                                    }];
    [dataTask resume];
    

                                          

}
- (IBAction)serchController:(id)sender
{
    [self performSegueWithIdentifier:@"search" sender:self];
}
-(void)receiveData:(NSNotification*)locationName
{
    NSString* location = [[locationName userInfo] valueForKey:@"company"];
    
    
    NSLog(@"Location is %@",location);
    NSString* newUrl = [NSString stringWithFormat:@"http://marketdata.websol.barchart.com/getQuote.json?key=7a9e8fc2aa594e4e80a7d8c245cf1737&symbols=%@",location];
    NSLog(@"new url %@",newUrl);
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:newUrl] completionHandler:^(NSData *data,NSURLResponse* response,NSError* error)
    {
    self.json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
       
        
    self.companyNames= [self.json valueForKey:@"results"];
       
        
        NSLog(@"%@",[self.companyNames valueForKey:@"symbol"]);
        
       // [self.companyNames addObjectsFromArray:keysAndValues];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableViewDisplay reloadData];
            
            
        });

        
        
    }];
    
    [dataTask resume];
    
    
    
}

@end
