//
//  ViewController.m
//  SearchBarControllerDemo
//
//  Created by test on 5/23/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property(strong,nonatomic)NSMutableArray* totalString;
@property (nonatomic, strong) NSMutableArray *filteString;

@property (assign,nonatomic)BOOL isFiltered;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.totalString  = [[NSMutableArray alloc]initWithObjects:@"one",@"two",@"three",@"four",@"five",@"six",@"seven",@"eight",@"nine",@"ten", nil];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.searchBar.delegate = self;
       
    
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.tableView resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length==0)
    {
        self.isFiltered=NO;
    }
    else
    {
        self.isFiltered=YES;
        self.filteString = [[NSMutableArray alloc]init];
        
        for (NSString* str in self.totalString) {
            NSRange stringRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if (stringRange.location != NSNotFound) {
                [self.filteString addObject:str];
            }
        }
    }
    [self.tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isFiltered)
    {
        return [self.filteString count];
    }
    return [self.totalString count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (!self.isFiltered)
    {
        cell.textLabel.text = self.totalString[indexPath.row];
    }
    else
    {
        cell.textLabel.text = self.filteString[indexPath.row];
    }
    return cell;
}


@end
