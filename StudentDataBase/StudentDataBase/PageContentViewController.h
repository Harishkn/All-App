//
//  PageContentViewController.h
//  StudentDataBase
//
//  Created by test on 5/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImage;
@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;

@end
