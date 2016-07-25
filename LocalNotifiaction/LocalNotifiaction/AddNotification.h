//
//  AddNotification.h
//  LocalNotifiaction
//
//  Created by test on 5/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNotification : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *displayText;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
