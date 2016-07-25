//
//  ViewController2.m
//  CollectionView
//
//  Created by test on 4/29/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UIImageView *displayImage;
@property (weak, nonatomic) IBOutlet UITextView *textDescription;

@property (strong,nonatomic) NSArray* imageList;

@property (strong,nonatomic) NSArray* placeDescrption;
@property (assign,nonatomic)int received;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageList = [[NSArray alloc]initWithObjects:@"banglore",@"manglore",@"dhoodsagar",@"goldentemple",@"madikeri",@"melukote",@"mysore",@"nanjanagudu",@"yanna", nil];
    
    self.placeDescrption = [[NSArray alloc]initWithObjects:@"A succession of South Indian dynasties, the Western Gangas, the Cholas and the Hoysalas, ruled the present region of Bangalore until in 1537 CE, Kempé Gowdā – a feudal ruler under the Vijayanagara Empire – established a mud fort considered to be the foundation of modern Bangalore. In 1638, the Marāthās conquered and ruled Bangalore for almost 50 years, after which the Mughals captured and sold the city to the Mysore Kingdom of the Wadiyar dynasty. It was captured by the British after victory in the Fourth Anglo-Mysore War (1799), who returned administrative control of the city to the Maharaja of Mysore. The old city developed in the dominions of the Maharaja of Mysore and was made capital of the Princely State of Mysore, which existed as a nominally sovereign entity of the British Raj. In 1809, the British shifted their cantonment to Bangalore, outside the old city, and a town grew up around it, which was governed as part of British India. Following India's independence in 1947, Bangalore became the capital of Mysore State, and remained capital when the new Indian state of Karnataka was formed in 1956. The two urban settlements of Bangalore – city and cantonment – which had developed as independent entities merged into a single urban centre in 1949. The existing Kannada name, Bengalūru, was declared the official name of the city in 2006.",
        @"It developed as a port on the Arabian Sea—remaining, to this day, a major port of India. Lying on the backwaters of the Netravati and Gurupura rivers, Mangalore is often used as a staging point for sea traffic along the Malabar Coast. The city has a tropical climate and lies in the path of the Arabian Sea branch of the South-West monsoons. Mangalore's port handles 75 per cent of India's coffee and cashew exports.[12]Mangalore was ruled by several major powers, including the Kadambas, Alupas, Vijayanagar Empire, Keladi Nayaks and the Portuguese. The city was a source of contention between the British and the Mysore rulers, Hyder Ali and Tipu Sultan. Eventually annexed by the British in 1799, Mangalore remained part of the Madras Presidency until India's independence in 1947. The city was unified with the state of Mysore (now called Karnataka) in 1956.[13]",
                            @"Dudhsagar Falls (literally Sea of Milk ) is a four-tiered waterfall located on the Mandovi River in the Indian state of Goa. It is 60 km from Panaji by road and is located on the Madgaon-Belgaum rail route about 46 km east of Madgaon and 80 km south of Belgaum. Dudhsagar Falls is amongst India's tallest waterfalls with a height of 310 m(1017 feet) and an average width of 30 metres (100 feet).Lower half of Dudhsagar FallsThe falls is located in the Bhagwan Mahaveer Sanctuary and Mollem National Park among the Western ghats. The waterfall forms the border between Karnataka and Goa states. The area is surrounded by a deciduous forests with a rich bio diversity. The falls are not particularly spectacular during the dry season but during the monsoon season however, the falls are fed by rains and form a huge force of water.",
                            @"Bylakuppe (Kannada: ಬೈಲಕುಪ್ಪೆ Bailakuppe, Tibetan: བ་ལ་ཀུ་པེ་ Balakupé) is an area in Karnataka which is home to the Indian town Bylakuppe and several Tibetan settlements (there are several Tibetan settlements in India), established by Lugsum Samdupling (in 1961) and Dickyi Larsoe (in 1969). It is located to the west of Mysore district in the Indian state of Karnataka which is roughly 80 km from Mysore city. Twin (Indian) town Kushalanagar is about 6 kilometres (3.7 mi) from Bylakuppe. It also shares the border with Eastern part of Coorg district.",
                            @"Talakaveri (Kannada: ತಲಕಾವೇರಿ), is the place that is generally considered to be the source of the river Kaveri. It is located by Brahmagiri hill (not to be confused with the Brahmagiri range further south) near Bhagamandala in Kodagu district, Karnataka, 1,276 m. above sea level. However, there is not a permanent visible flow from this place to the main rivercourse except during the rainy season.A tank or kundike has been erected on a hillside by kodavas, at the place that is said to be the origin. It is also marked by a small temple, and the area is frequented by pilgrims mainly it is the worship place of kodavas. The river originates as a spring feeding this tank, which is considered to be a holy place to bathe on special days. The waters are then said to flow underground to emerge as the Kaveri river some distance away. The temple has been renovated extensively by the state government recently [2007].",
                            @"Melukote in Pandavapura taluk of Mandya district, Karnataka, in southern India, is one of the sacred places in Karnataka. The place is also known as Thirunarayanapuram. It is built on rocky hills, known as Yadugiri, Yaadavagiri and Yadushailadweepa, overlooking the Cauvery valley. Melukote is about 51 km (32 miles) from Mysore and 133 km (83 mi) from Bangalore.Melukote is the location of the Cheluvanarayana Swamy Temple, with a collection of crowns and jewels which are brought to the temple for the annual celebration. On the top of the hill is the temple of Yoganarasimha. Many more shrines and ponds are located in the town. Melukote is home to the Academy of Sanskrit Research, which has collected thousands of manuscripts.",
                            @"The Palace of Mysore is a historical palace in the city of Mysore in Karnataka, southern India. It is the official residence and seat of the Wodeyars — the Maharajas of Mysore, the royal family of Mysore, who ruled the princely state from 1399 to 1950. The palace houses two durbar halls (ceremonial meeting halls of the royal court) and incorporates a mesmerizing and gigantic array of courtyards, gardens, and buildings. The palace is in the central region of inner Mysore, facing the Chamundi Hills eastward.Mysore is commonly described as the City of Palaces. There are about seven palaces inclusive of this; however, Mysore Palace refers specifically to the one within the Old Fort. Built by the Maharaja Rajarshi His Highness Krishnarajendra Wadiyar IV, Mysore Palace is now one of the most famous tourist attractions in India, after the Taj Mahal, and has more than 6 million visitors annually.[1]",
                            @"Nanjangud ( Kannada: ನಂಜನಗೂಡು ) is a town in Mysore district in the Indian state of Karnataka. Nanjangud lies on the banks of the river Kapila (Kabini), 23 km from the city of Mysore. Nanjangud is famous for Srikanteshwara Temple. Nanjangud is also called Dakshina Kashi (southern Kashi).[2] This city is also famous for a variety of banana grown in the region, the Nanjanagoodu rasabale.[3]",
                            @"Yana (Kannada: ಯಾಣ) is a village located in forests of the Uttara Kannada district of Karnataka, India which is known for the unusual rock formations (Karst) or (Asteroid). It is located in the Sahyadri mountain range of the Western Ghats, about 60 kilometres (37 mi) from Karwar port, 40 kilometres (25 mi) from Sirsi, and 31 kilometres (19 mi) from Kumta. The two unique rock outcrops near the village are a tourist attraction and easily approachable by a small trek through 0.5 kilometres (0.31 mi) of thick forests from the nearest road head.[1][2][3][4]",nil];
    
    self.displayImage.image = [UIImage imageNamed:[self.imageList objectAtIndex:self.received]];
    
    self.textDescription.text = [self.placeDescrption objectAtIndex:self.received];
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
-(void)receiveData:(int)receiveData
{
    self.received = receiveData;
}

@end
