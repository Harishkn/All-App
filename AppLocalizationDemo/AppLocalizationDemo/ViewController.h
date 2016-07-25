//
//  ViewController.h
//  AppLocalizationDemo
//
//  Created by test on 6/2/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *localeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property(strong,nonatomic)IBOutletCollection(UILabel)NSArray *labels;
@end

