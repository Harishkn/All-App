//
//  TableViewCell.h
//  CustomTableApp
//
//  Created by test on 4/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *empNamelbl;
@property (weak, nonatomic) IBOutlet UILabel *designationlbl;
@property (weak, nonatomic) IBOutlet UIImageView *imageDisplay;
@property (weak, nonatomic) IBOutlet UILabel *emailIDlbl;
@property (weak, nonatomic) IBOutlet UILabel *ageLbl;
@property (weak, nonatomic) IBOutlet UILabel *mobileNumberLbl;
@property (weak, nonatomic) IBOutlet UILabel *locationLbl;

@end
