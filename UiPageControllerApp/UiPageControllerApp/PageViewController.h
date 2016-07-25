//
//  PageViewController.h
//  UiPageControllerApp
//
//  Created by test on 5/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImage;
@property NSUInteger pageIndex;

@property NSString *imageFile;

@end
