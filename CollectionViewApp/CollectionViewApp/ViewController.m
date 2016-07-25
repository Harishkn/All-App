//
//  ViewController.m
//  CollectionViewApp
//
//  Created by test on 4/29/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *playerNameLbl;
@property (weak, nonatomic) IBOutlet UITextView *playerDescLbl;

@property (strong,nonatomic)NSArray* playerImages;

@property (strong,nonatomic)NSArray* playerNames;

@property (assign,nonatomic)int storeValue;

@property (strong,nonatomic)NSArray* playerDescription;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.playerImages =[[NSArray alloc]initWithObjects:@"abd",@"aron",@"binny",@"chahal",@"gayle",@"kohli",@"sarfaraz",@"watson", nil];
    
    self.playerNames =[[NSArray alloc]initWithObjects:@"ABD",@"Aron",@"Binny",@"Chahal",@"Gayle",@"Kohli",@"Sarfaraz",@"Watson", nil];
    
    self.playerDescription = [[NSArray alloc]initWithObjects:@"A delightfully brutal batsman, a more than decent wicket-keeper and an agile fielder that can put an acrobat to shame – there are very few things (if any) that Abraham Benjamin de Villiers cannot do on a cricket field. Yes, he also has two Test wickets to his name. South Africa’s one-day captain was a key player in the Delhi Daredevils’ middle order in the first three editions of the IPL. He was bought by the Royal Challengers Bangalore for USD 1.1 million at the IPL Player Auction 2011. Since then, he has joined hands with Chris Gayle in tearing bowling attacks apart with utter disdain. During the 2012 season, when playing the role of a finisher, he snatched wins from the jaws of defeat. He unearthed some outrageous shots to incredible effect and in one over, smashed Dale Steyn for 23 – hitting him for two fours and two sixes – to win RCB a thriller. The menace of de Villiers continued in the next season which led the RCB management to retain him in their ranks. de Villiers’ most menacing IPL innings came in the 2015 season when he decimated the Mumbai Indians attack at the Wankhede Stadium, smashing an unbeaten 133 in 59 balls.",
        @"Varun Aaron, the speedster from Jamshedpur, is a product of the MRF Pace Foundation and even went on to represent the Australian Institute of Sport team. He was picked by the Kolkata Knight Riders going into IPL 2010 after he impressed Sourav Ganguly and bowling coach, Wasim Akram at the team trials. Aaron was signed by the Delhi Daredevils ahead of IPL 2011 and continued to play for them in IPL 2012. In the 12-month period between IPL 2011 and IPL 2012, the Jharkhand pacer was called up to the Indian team; he won his maiden Test cap when the West Indies toured India in 2011 and featured in four ODIs as well. An injury ruled him out of cricket for quite a while but as soon as he attained total fitness, he was summoned into the Indian squad for the tour of New Zealand. Aaron was picked up by Royal Challengers Bangalore at the Player Auction ahead of IPL 2014 and will be part of the franchise in Vivo IPL 2016.",
            @"An all-rounder, Stuart Binny played a crucial role in Rajasthan Royal’s fortunes, especially in the 2013 season. Primarily a hard-hitting batsman, he has proved that he has the temperament, technique and survival skills to suit all formats of the game. A right-hand batsman and medium-pacer from Karnataka, Binny also has the experience of leading his state side in the domestic circuit. Along with being the leading run-scorer for Karnataka in 2011-12, Binny also claimed his maiden 10-wicket haul in first-class cricket during that season. He carried his form into the IPL 2013 which led to a call-up into the national side as well. In the IPL Player Auction 2016, Binny was snapped up by Royal Challengers Bangalore and the all-rounder will get a chance to play more often in the familiar surrounds of the M Chinnaswamy Stadium.",
                @"Yuzvendra Chahal is a leg-spinner who plays domestic cricket for Haryana. After impressing at the U-19 level and spending time at the National Cricket Academy, he graduated to first-class cricket. He made his Ranji Trophy debut for Haryana in 2009. A good outfielder too, Chahal first turned out for the Mumbai Indians in IPL 2011. He was bought by RCB at the IPL Player Auction 2014. He was the team’s highest wicket-taker in the 2015 season and will be hoping to do plenty of damage in Vivo IPL 2016.",
                @"Chris Gayle, at his best, is devastating. He is the first player to have scored a century in international Twenty20 cricket; the only man to score seven or more tons in the Twenty20 format; and is the leading six-hitter in Twenty20s. This Jamaican batsman is all about power and brute force. Besides playing for his home team, Jamaica, in the Caribbean Twenty20 competition and the Royal Challengers Bangalore in the IPL, Gayle struts his stuff for various T20 franchises around the world. He has enjoyed success everywhere he’s played, as no boundary or total is beyond his reach. The big man from Caribbean is also a safe catcher and a handy off-spinner. In three years he has donned the RCB cap, Gayle has single-handedly won matches for them. In the 2012 season he shattered all boundaries, piling up agony worth 733 runs over the bowlers, scoring at a rate of 160 runs per 100 balls. The next year he took the T20 world by storm with a knock of 175 against Pune Warriors India. The swaggerer from Caribbean was too valuable an asset to let go for the Bengaluru-based franchise and hence he was retained ahead of the 2014 season.",
                    @"Virat Kohli, India’s Test captain, has rapidly come up through the system to emerge as one of the world’s leading batsmen. He was the captain of the Indian team that won the 2008 ICC U-19 World Cup. Virat is the quintessential new-age cricketer who plays his game aggressively and is unafraid to express his emotions on the field. The flamboyant cricketer is also known to enjoy the lifestyle that comes with being a star. All this, while being a consistent performer for his side. He can perform calmly and consistently under pressure, and has delivered many match-winning performances over the last few years. Virat is also a good fielder and can bowl an occasional spell of medium pace. By making him in charge of the team for a few games in IPL 2012, the Royal Challengers Bangalore groomed him as their next leader, which he eventually became in the 2013 season. Retained by the franchise ahead of the IPL Player Auction 2014, Virat continues to lead the side.",
                    @"This hard-hitting batsman from Mumbai has been making waves in the domestic circuit for his prolific run-making since age-level cricket. A clean hitter of the ball, Sarfaraz is known to score quickly too. He has been piling on runs in the Mumbai ‘maidans’ and made his first-class debut in 2014-15. He has also represented India in Under-19 cricket. He impressed one and all with his fearless brand of batting in IPL 2015 – his debut IPL season – and the ability to stay calm in the slog overs. He was one of the leading batsmen in the 2016 Under-19 World Cup and played a crucial role in taking India to the final.",
                        @"Shane Watson was part of Rajasthan Royals since the inaugural IPL season, in 2008. That IPL season also helped him make an improbable comeback to international cricket. After being sidelined due to injuries, Watson decided to join the Royals and emerged the Player of the Tournament in the first edition of the tournament. Also known as ‘Watto’, he is an attacking batsman with a solid defence. An athletic fielder and a medium-pacer he can swing the ball and pick up useful wickets. The all-rounder has always played a crucial role in his IPL team’s fortunes, and RCB will hope he brings in the same aggression and firepower into their camp in Vivo IPL 2016.",nil];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.playerImages.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.displayPlayerImages.image = [UIImage imageNamed:self.playerImages[indexPath.row]];
    
//    self.playerNameLbl.text = [self.playerNames objectAtIndex:indexPath.row];
//    
//    self.playerDescLbl.text = [self.playerDescription objectAtIndex:indexPath.row];

    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.storeValue = (int)indexPath.row;
    
    self.playerNameLbl.text = [self.playerNames objectAtIndex:self.storeValue];
    
    self.playerDescLbl.text = [self.playerDescription objectAtIndex:self.storeValue];
    
}

@end
