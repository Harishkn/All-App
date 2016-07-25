//
//  ViewController.h
//  Segues
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (strong,nonatomic) NSString* nameStr;
@property (strong,nonatomic) NSString* passStr;

@end

