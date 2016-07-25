//
//  EmployeeModel.h
//  ToDoListEditingAndDeleting
//
//  Created by test on 5/5/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeModel : NSObject

@property(strong,nonatomic)NSString* empName;

@property(assign,nonatomic)int empAge;

-(instancetype)initWithName:(NSString*)name Age:(int)age;

@end
