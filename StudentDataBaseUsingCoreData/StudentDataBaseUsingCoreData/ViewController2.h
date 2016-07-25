//
//  ViewController2.h
//  StudentDataBaseUsingCoreData
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SecondViewControllerDelegate <NSObject>
@required
- (void)dataFromController:(NSString *)data;

@end
@interface ViewController2 : UIViewController

@property (nonatomic, weak) id<SecondViewControllerDelegate> delegate;
@end
