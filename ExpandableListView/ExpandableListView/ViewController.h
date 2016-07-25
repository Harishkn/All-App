//
//  ViewController.h
//  ExpandableListView
//
//  Created by test on 5/24/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)NSArray* sectionTitleArray;
@property(strong,nonatomic)NSMutableArray* arrayForBool;

@end

