//
//  EmployeeModel.m
//  ToDoListEditingAndDeleting
//
//  Created by test on 5/5/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "EmployeeModel.h"

@implementation EmployeeModel

- (instancetype)initWithName:(NSString *)name Age:(int)age
{
    self = [super init];
    if (self) {
        self.empName = name;
        self.empAge = age;
    }
    return self;
}

@end
