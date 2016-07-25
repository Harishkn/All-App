//
//  ViewController.h
//  UiButton
//
//  Created by test on 4/1/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)submitbutton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *colorNameLabel;
- (IBAction)submitpreviousbutton:(id)sender;


@end

