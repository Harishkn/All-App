//
//  SearchViewController.m
//  StockExchangeApplication
//
//  Created by test on 7/19/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)NSArray* companyLists;
@property(strong,nonatomic)NSArray* jsonResult;
@property(strong,nonatomic)NSDictionary* json;
@property(strong,nonatomic)NSString* selectedCompany;
@property(strong,nonatomic)NSDictionary* selectedCompDict;
@end

@implementation SearchViewController

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
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    NSString* newUrl = [NSString stringWithFormat:@"http://d.yimg.com/aq/autoc?query=%@&region=IN&lang=en-US",searchText];
    
    NSLog(@"the new url %@",newUrl);
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:newUrl] completionHandler:^(NSData *data,NSURLResponse* response,NSError* error)
                                      {
                                          self.json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                           NSLog(@"%@",_json);
                                          self.jsonResult = [self.json valueForKey:@"ResultSet"];
                                          self.companyLists = [self.jsonResult valueForKey:@"Result"];
                                          
                                          NSLog(@"company lists are %@",[self.companyLists valueForKey:@"symbol"]);
                                         
                                          dispatch_async(dispatch_get_main_queue(), ^{
                                              [self.tableView reloadData];
                                          });
                                          
                                          
                                      }];
    [dataTask resume];
    [searchBar resignFirstResponder];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"The value is %ld",self.areaValue.count);
    return self.companyLists.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
   // NSLog(@"table cell value is %@",[self.areaValue componentsJoinedByString:@""]);
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.companyLists valueForKey:@"symbol"][indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    
    self.selectedCompany = selectedCell.textLabel.text;
    
    NSLog(@"selected comapny %@",self.selectedCompany);
    
    self.selectedCompDict = [NSDictionary dictionaryWithObject:self.selectedCompany forKey:@"company"];
    
    NSLog(@"dict value is %@",self.selectedCompDict);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"citiesListComplete" object:nil userInfo:self.selectedCompDict];
//    
//    [self.tableView setHidden:YES];
//    
//  [self dismissViewControllerAnimated:YES completion:nil];
//    
   [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}

@end
