//
//  TableViewCell.h
//  StudentDataBaseUsingCoreData
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *locationLbl;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *ageLbl;

@property (weak, nonatomic) IBOutlet UILabel *usnLbl;
@end
