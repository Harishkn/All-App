//
//  ViewController.m
//  TableViewApllication
//
//  Created by test on 4/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)NSArray* foodItems;

@property (strong,nonatomic)NSArray* foodImages;

@property (assign,nonatomic)int selectedItem;
@property (nonatomic,strong) NSString *sendingFoodName;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.foodItems = [[NSArray alloc]initWithObjects:@"burger",@"sandwich",@"french fries",@"gobi",@"Mushroom",@"Rolls", nil];
    
    self.foodImages = [[NSArray alloc]initWithObjects:@"burger",@"sandwich",@"fries",@"gobi",@"mashroom",@"rolls", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.foodItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.foodItems[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.foodImages[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.sendingFoodName = [self.foodItems objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"scene2" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2* vc2 = [segue destinationViewController];
    
    [vc2 receivedata:self.sendingFoodName];
}

@end
