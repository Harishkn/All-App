//
//  LoginViewController.h
//  UIPageViewController
//
//  Created by test on 5/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *displayImage;
@property (weak, nonatomic) IBOutlet UITextField *empIdText;
@property (weak, nonatomic) IBOutlet UITextField *empNameText;
- (IBAction)loginButton:(id)sender;

@end
