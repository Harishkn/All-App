//
//  ViewController.h
//  UiPageControllerApp
//
//  Created by test on 5/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPageViewControllerDataSource>
- (IBAction)login:(id)sender;

- (IBAction)register:(id)sender;

@property(strong,nonatomic)UIPageViewController* pageViewController;

@property(strong,nonatomic)NSArray* pageTitle;
@property(strong,nonatomic)NSArray* pageImage;
@end

