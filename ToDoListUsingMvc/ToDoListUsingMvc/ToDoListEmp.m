//
//  ToDoListEmp.m
//  ToDoListUsingMvc
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ToDoListEmp.h"

@implementation ToDoListEmp

- (instancetype)initWithName:(NSString *)name designation:(NSString *)desig
{
    self = [super init];
    if (self)
    {
        self.empName = name;
        self.empDesignation = desig;
    }
    return self;
}

@end
