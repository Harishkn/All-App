//
//  ViewController.m
//  PlayersGame
//
//  Created by test on 4/21/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *player1Strength;
@property (weak, nonatomic) IBOutlet UILabel *player2Strength;
@property (assign,nonatomic)NSInteger player1Count;

@property (assign,nonatomic)NSInteger player2Count;

@property (assign,nonatomic)NSInteger count1;

@property (assign,nonatomic)NSInteger count2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.count1=0;
    //self.count2=0;
    _player1Count = 20;
    _player2Count = 20;
    self.player1Strength.text = [NSString stringWithFormat:@"player1 strength %ld",self.player1Count];
    
    self.player2Strength.text = [NSString stringWithFormat:@"player2 strength %ld",self.player2Count];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)player1Button:(id)sender
{
  self.count1 =  _player2Count--;
    [self display];
    if(self.player2Count <=10)
    {
        self.player2Strength.backgroundColor = [UIColor redColor];
    }
    if(_player2Count==0)
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Game Finish Alert"
                                                                       message:@"Player 1 won the game ."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}
- (IBAction)player2Button:(id)sender
{
  self.count2 = _player1Count--;
    [self display];
    if(self.player1Count <=10)
    {
        self.player1Strength.backgroundColor = [UIColor redColor];
    }
    if(_player1Count == 0)
    {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Game Finish alert"
                                                                   message:@"Player2 Won the game."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    }
}
-(void)display
{
    self.player1Strength.text = [NSString stringWithFormat:@"Player1 strength %ld",self.count2];
    
    self.player2Strength.text = [NSString stringWithFormat:@"Player2 strength %ld",self.count1];
}
@end
