//
//  LoginController.h
//  SeguesApp1
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *displayName;
@property (weak, nonatomic) IBOutlet UILabel *displayPassword;
-(void)displayValues:(NSString*)nmeText password:(NSString*)pwdText;
@end
