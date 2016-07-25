//
//  ViewController2.m
//  CustomTableApp2
//
//  Created by test on 4/27/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"
#import "TableViewCell.h"

@interface ViewController2 ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (strong,nonatomic)NSArray* receivedData;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)receiveArray:(NSArray*)receive;
{
    self.receivedData = receive;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"forIndexPath:indexPath];
    
    cell.nameLbl.text = [NSString stringWithFormat:@"%@",[self.receivedData objectAtIndex:0]];
    
    cell.ageLbl.text = [NSString stringWithFormat:@"%@",[self.receivedData objectAtIndex:1]];
    
    cell.genderLbl.text = [NSString stringWithFormat:@"%@",[self.receivedData objectAtIndex:2]];
    
    cell.countryLbl.text = [NSString stringWithFormat:@"%@",[self.receivedData objectAtIndex:3]];
    return cell;
}
- (IBAction)doneButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
