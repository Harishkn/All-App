//
//  ViewController.m
//  WebServicesDataTask1
//
//  Created by test on 5/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic)NSArray* jsonArray;
@property(strong,nonatomic)NSArray* json;
@property(strong,nonatomic)NSDictionary* jsonDict;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    Model* model = [self.modelArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.track;
    
    return cell;
}



- (IBAction)start:(id)sender
{
    [self.activityIndicator startAnimating];
    self.modelArray=[[NSMutableArray alloc]init];
    NSURLSession* session  = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"]completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          NSError* errorparsing = nil;
                                          if(error==nil){
                                              self.jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&errorparsing];
                                              
                                              if(errorparsing==nil)
                                              {
                                                  self.jsonArray = [self.jsonDict valueForKey:@"results"];
                                                  
                                                  for(NSDictionary *dict in self.jsonArray)
                                                  {
                                                      Model* model = [[Model alloc]initWithName:[dict valueForKey:@"artistName"] trackName:[dict valueForKey:@"trackName"]];
                                                      [self.modelArray addObject:model];
                                                      
                                                  }
                                              }
                                          }
                                          
                                          [self.tableView reloadData];
                                          [self.activityIndicator stopAnimating];
                                          //[self.activityIndicator hidesWhenStopped];
                                          self.activityIndicator.hidden=YES;
                                          
                                      }];
    
    [dataTask resume];
  
}
- (IBAction)resume:(id)sender {
}
- (IBAction)cancel:(id)sender {
}
@end
