//
//  ViewController.h
//  StudentDataBase
//
//  Created by test on 5/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPageViewControllerDataSource>
@property(strong,nonatomic)UIPageViewController* pageViewController;

@property(strong,nonatomic)NSArray* pageTitle;
@property(strong,nonatomic)NSArray* pageImage;


@end

