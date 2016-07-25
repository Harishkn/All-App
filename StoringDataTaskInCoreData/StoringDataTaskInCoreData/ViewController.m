//
//  ViewController.m
//  StoringDataTaskInCoreData
//
//  Created by test on 5/17/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Model.h"
#import <CoreData/CoreData.h>


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (strong,nonatomic)NSArray* jsonArray;
@property(strong,nonatomic)NSArray* json;
@property(strong,nonatomic)NSDictionary* jsonDict;
@property (weak, nonatomic) IBOutlet UITableView *tableDisplay;
@property(strong,nonatomic)NSString* track;
@property (strong,nonatomic)NSMutableArray* coreObj;
@property(strong,nonatomic)NSString* nme;
@property(strong,nonatomic)NSString* tra;
@property(strong,nonatomic)NSMutableArray* employeeIDs;
@property(strong,nonatomic)NSMutableArray* allnames;
@property(strong,nonatomic)NSArray*  searchResults;
@property(strong,nonatomic)NSMutableArray* filterString;
@property(assign,nonatomic)BOOL isFiltered;

- (IBAction)download:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   [self fetchData];
    
    self.tableDisplay.delegate = self;
    self.tableDisplay.dataSource = self;
    self.searchBar.delegate = self;
    


}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.tableDisplay resignFirstResponder];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length==0)
    {
        self.isFiltered=NO;
    } else
    {
        self.isFiltered=YES;
        self.
        self.filterString = [[NSMutableArray alloc]init];
        for (NSString* str in self.allnames)
        {
            NSRange stringRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if(stringRange.location != NSNotFound)
            {
                [self.filterString addObject:str];
            }
        }
    }
   
    [self.tableDisplay reloadData];
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
    if(_isFiltered)
    {
        return [self.filterString count];
    }
    return [self.coreObj count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *simpleTableIdentifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSManagedObject* obj = self.coreObj[indexPath.row];
    
    if(!self.isFiltered)
    {
        cell.textLabel.text = [obj valueForKey:@"name"];
        cell.detailTextLabel.text = [obj valueForKey:@"track"];
    }
    else
    {
        cell.textLabel.text = self.filterString[indexPath.row];
    }
    

    
    [self.activityIndicator stopAnimating];
    //[self.activityIndicator hidesWhenStopped];
    self.activityIndicator.hidden=YES;
    return cell;
   
}

- (IBAction)download:(id)sender
{
   
    [self.activityIndicator startAnimating];
    [self downloadData];
  
   
    
}
-(NSManagedObjectContext*)getContext
{
    AppDelegate* app = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext* context = [app managedObjectContext];
    return context;
}
-(void)fetchData
{
   
    NSManagedObjectContext* context = [self getContext];
    NSFetchRequest* fetch = [NSFetchRequest fetchRequestWithEntityName:@"DataTask"];
    NSError* error =nil;
    self.coreObj = [[NSMutableArray alloc]initWithArray:[context executeFetchRequest:fetch error:&error]];
    
    fetch.resultType = NSDictionaryResultType;
    
    [fetch setPropertiesToFetch:[NSArray arrayWithObjects:@"name",nil]];
    
    NSArray *results    = [context executeFetchRequest:fetch
                                                 error:&error];
    
    self.allnames = [[NSMutableArray alloc]init];
   
    
    self.allnames = [results valueForKey:@"name"];
    
    
   
    
}
-(void)downloadData
{
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
                            NSManagedObjectContext* context = [self getContext];
                            for(NSDictionary *dict in self.jsonArray)
                            {
                                 NSManagedObject* person = [NSEntityDescription insertNewObjectForEntityForName:@"DataTask" inManagedObjectContext:context];
    
        self.nme = [dict valueForKey:@"artistName"];
        self.tra = [dict valueForKey:@"trackName"];
                                NSLog(@"%@",self.nme);
                                NSLog(@"%@",self.tra);
                [person setValue:self.nme forKey:@"name"];
                [person setValue:self.tra forKey:@"track"];
                                NSError* error = nil;
                                
                                if(self.coreObj.count==0)
                                {
                                if([context save:&error])
                                {
                                    NSLog(@"saved data done");
                                    
                                }
                                else{
                                    NSLog(@"failed to save data %@",error.localizedDescription);
                                }
                                }
                                else{
                                    [self.tableDisplay reloadData];
                                    }

                                
                        }
                                              }
                                          }
                    [self fetchData];
                    [self.tableDisplay reloadData];
                                          [self.activityIndicator stopAnimating];
                                          //[self.activityIndicator hidesWhenStopped];
                                          self.activityIndicator.hidden=YES;
                                          
                                      }];
    
    [dataTask resume];

}
@end
