//
//  ToDoListEmp.h
//  ToDoListUsingMvc
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoListEmp : NSObject
@property (strong,nonatomic)NSString* empName;
@property (strong,nonatomic)NSString* empDesignation;

-(instancetype)initWithName:(NSString*)name designation:(NSString*)desig;
@end
