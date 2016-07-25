//
//  DisplayData.m
//  StudentDataBase
//
//  Created by test on 5/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "DisplayData.h"


@interface DisplayData ()
@property (strong,nonatomic)NSArray* sandalsList;
@property(strong,nonatomic)NSArray* tshirtList;
@property(strong,nonatomic)NSArray* formalsList;
@property(assign,nonatomic)int value;
@end

@implementation DisplayData

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sandalsList = [[NSArray alloc]initWithObjects:@"one",@"two",@"three",@"four",@"five",@"six",@"seven",@"eight", nil];
    
    self.tshirtList = [[NSArray alloc]initWithObjects:@"t1",@"t2",@"t3",@"t4",@"t5", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.sandalsList.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.layer.cornerRadius = 20.0;
    cell.displayImages.image = [UIImage imageNamed:self.sandalsList[indexPath.row]];
    
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.value = (int)indexPath.row;
    [self performSegueWithIdentifier:@"datadescription" sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender { 
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
