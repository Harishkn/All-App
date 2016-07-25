//
//  ViewController.m
//  AVkitAudioPlayer
//
//  Created by test on 4/25/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageOutlet;
@property (weak, nonatomic) IBOutlet UILabel *totalSongDurationOutlet;
@property (weak, nonatomic) IBOutlet UILabel *currentSongDurationOutlet;
@property (weak, nonatomic) IBOutlet UILabel *displaySongNameOutlet;
@property (weak, nonatomic) IBOutlet UIButton *playButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *backwardButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *forwardButtonOutlet;
@property (weak, nonatomic) IBOutlet UISlider *volumeSliderOutlet;

@property (strong,nonatomic) NSMutableDictionary* songList;

@property (strong,nonatomic)AVAudioPlayer* player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // self.songList = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"a",@"1.mp3",@"b",@"2.mp3",@"c",@"3.mp3",@"d",@"4.mp3",@"e",@"5.mp3",@"f",@"6.mp3",@"g",@"7.mp3",nil];
    
    NSString* filePath = [[NSBundle mainBundle]pathForResource:@"Ladio - Www.Tamilsongskey.Com" ofType:@"mp3"];
    
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL URLWithString:filePath] error:nil];
    
    NSLog(@"%@",filePath);
    self.player.delegate = self;
    
    [self.player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)playButtonAction:(id)sender
{
    //[self.player play];
}
- (IBAction)forwardButtonAction:(id)sender {
}
- (IBAction)backwardButtonAction:(id)sender {
}
- (IBAction)volumeSliderAction:(id)sender
{
    [self.player setVolume:self.volumeSliderOutlet.value];
}

@end
