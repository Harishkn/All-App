//
//  ViewController2.m
//  TableFoodApplication
//
//  Created by test on 4/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UIImageView *imageDisplay;
@property (weak, nonatomic) IBOutlet UITextView *displayText;

@property (strong,nonatomic)NSArray* itemDescription;

@property (strong,nonatomic)NSArray* foodImages;
@property (assign,nonatomic)int receive;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.itemDescription = [[NSArray alloc]initWithObjects:@"A hamburger (or cheeseburger when served with a slice of cheese) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. Hamburgers may be cooked in a variety of ways, including pan-frying, barbecuing, and flame-broiling. Hamburgers are often served with cheese, lettuce, tomato, bacon, onion, pickles, and condiments such as mustard, mayonnaise, ketchup, relish, and chiles.[1]",
    @"A sandwich is a food item consisting of one or more types of food, such as vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein two or more pieces of bread serve as a container or wrapper for some other food.[1][2][3] The sandwich was originally a portable food item or finger food which began to be popular in the Western World. Today sandwiches in various versions are found worldwide.",
    @"French fries (American English), chips,[1] fries,[2] finger chips,[3] or French-fried potatoes are batonnet or allummete cut potato that are normally deep-fried but could also be cooked in an oven.[4][5] In the United States and most of Canada, the term fries refers to any fried elongated pieces of potatoes, while in the United Kingdom, Australia, South Africa, Ireland and New Zealand, allumette cut fried potatoes are sometimes called shoestring fries to distinguish them from the batonnet cut chips.",
    @"Gobi Manchurian is the result of the adaptation of Chinese cooking and seasoning techniques to suit Indian tastes. It is believed to have been originally developed by a small Chinese community which lived in Kolkata for a century[when?]. In its two-stage preparation, the first stage requires preparing a spiced corn flour batter, dipping cauliflower florets in it and deep frying them. In the second stage, the deep fried florets are sautéed with chopped onion, capsicum, garlic, etc. in soy and chili sauce.",
    @"A mushroom (or toadstool) is the fleshy, spore-bearing fruiting body of a fungus, typically produced above ground on soil or on its food source.The standard for the name mushroom is the cultivated white button mushroom, Agaricus bisporus; hence the word mushroom is most often applied to those fungi (Basidiomycota, Agaricomycetes) that have a stem (stipe), a cap (pileus), and gills (lamellae, sing. lamella) on the underside of the cap. These gills produce microscopic spores that help the fungus spread across the ground or its occupant surface.",
    @"A roll is a small, often round loaf of bread served as a meal accompaniment (eaten plain or with butter). A roll can be served and eaten whole or cut transversely and dressed with filling between the two halves. Rolls are also commonly used to make sandwiches similar to those produced using slices of bread.", nil];
    
    self.foodImages = [[NSArray alloc]initWithObjects:@"burger",@"sandwich",@"fries",@"gobi",@"mushroom",@"rolls", nil];
    
    self.displayText.text = [self.itemDescription objectAtIndex:self.receive];
    
    self.imageDisplay.image = [UIImage imageNamed:[self.foodImages objectAtIndex:self.receive]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)doneButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)receveAllData:(int)receiveData
{
     self.receive = receiveData;
}

@end
