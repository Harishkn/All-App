//
//  ToDoList.h
//  ToDoListAppUsingMvc
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoList : NSObject

@property (strong,nonatomic)NSDate* dateList;
@property (strong,nonatomic)NSDateFormatter* format;
@property (strong,nonatomic)NSMutableArray* dateArray;
@property (strong,nonatomic)NSMutableArray* taskList;


@end
