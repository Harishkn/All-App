//
//  ViewController.m
//  CustomTablesEg2
//
//  Created by test on 4/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NSArray* imageList;

@property (strong,nonatomic) NSArray* nameList;

@property (strong,nonatomic) NSArray* detailedList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageList = [[NSArray alloc]initWithObjects:@"mark",@"satyanadela",@"stevejobs",@"sundarpichai", nil];
    
    self.nameList = [[NSArray alloc]initWithObjects:@"Mark",@"SatyaNadella",@"SteveJobs",@"SundarPichai", nil];
    
    self.detailedList = [[NSArray alloc]initWithObjects:@"Face book Founder in the year 2009",@"Micro Soft ",@"Founder of Apple",@"CEO of Google From India TamilNadu", nil];
    
//    .layer.backgroundColor=[[UIColor clearColor] CGColor];
//    .layer.cornerRadius=20;
//    .layer.borderWidth=2.0;
//    .layer.masksToBounds = YES;
//    .layer.borderColor=[[UIColor redColor] CGColor];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textlabl.text = self.nameList[indexPath.row];
    
    //cell.descriptionlbl.text = @"123";
    
    
    cell.imageOutlet.image = [UIImage imageNamed:self.imageList[indexPath.row]];
    
    cell.textOutlet.text = self.detailedList[indexPath.row];
    
    cell.imageOutlet.layer.cornerRadius = 63.0;
    cell.imageOutlet.layer.masksToBounds = true;
    cell.imageOutlet.layer.borderWidth=5.0;
    cell.imageOutlet.layer.borderColor=[[UIColor blueColor] CGColor];
    
    return cell;
}
@end
