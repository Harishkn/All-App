//
//  ViewConroller2.h
//  Segues
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewConroller2 : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
-(void)displayData:(NSString*)name password:(NSString*)password;
@end
