//
//  ViewController.h
//  UIPageViewController
//
//  Created by test on 5/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface ViewController : UIViewController <UIPageViewControllerDataSource>
- (IBAction)loginButton:(id)sender;
- (IBAction)registerButton:(id)sender;

@property(strong,nonatomic)UIPageViewController* pageViewController;

@property(strong,nonatomic)NSArray* pageTitle;
@property(strong,nonatomic)NSArray* pageImage;


@end

