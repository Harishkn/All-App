//
//  TableViewCell.h
//  ToDoListUsingCoreData
//
//  Created by test on 5/10/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *taskNameLbl;

@property (weak, nonatomic) IBOutlet UILabel *timeLbl;
@property (weak, nonatomic) IBOutlet UIButton *editOutlet;
@property (weak, nonatomic) IBOutlet UIButton *deleteOutlet;

@end
