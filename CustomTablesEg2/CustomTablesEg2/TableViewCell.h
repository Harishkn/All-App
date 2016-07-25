//
//  TableViewCell.h
//  CustomTablesEg2
//
//  Created by test on 4/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textOutlet;
@property (weak, nonatomic) IBOutlet UILabel *textlabl;

@property (weak, nonatomic) IBOutlet UIImageView *imageOutlet;

@end
