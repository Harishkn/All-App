//
//  ViewController.m
//  CollectionView
//
//  Created by test on 4/29/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "ViewController2.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong,nonatomic) NSArray* imageList;

@property (strong,nonatomic)NSArray* placeList;

@property(assign,nonatomic)int storeValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageList = [[NSArray alloc]initWithObjects:@"banglore",@"manglore",@"dhoodsagar",@"goldentemple",@"madikeri",@"melukote",@"mysore",@"nanjanagudu",@"yanna", nil];
    
    self.placeList = [[NSArray alloc]initWithObjects:@"VidhanSoudha",@"Manglore Beach",@"DhhodSagar",@"GoldenTemple",@"ThalaKaveri",@"Melukotte",@"Palce",@"Nanjangudu",@"Yanna", nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageList.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.layer.cornerRadius = 20.0;
    cell.displayImagecell.image = [UIImage imageNamed:self.imageList[indexPath.row]];
    
    cell.textLabl.text = self.placeList[indexPath.row];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.storeValue = (int)indexPath.row;
    [self performSegueWithIdentifier:@"scene2" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    ViewController2* vc2 = [segue destinationViewController];
    
    [vc2 receiveData:self.storeValue];
}
@end
