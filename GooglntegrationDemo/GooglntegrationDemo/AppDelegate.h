//
//  AppDelegate.h
//  GooglntegrationDemo
//
//  Created by test on 5/27/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate,GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

