//
//  EmployeeDetails.m
//  EmployeeappUsingMvc
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "EmployeeDetails.h"

@implementation EmployeeDetails



- (instancetype)initWithName:(NSString *)name designation:(NSString *)design age:(NSString *)age mobileNumber:(NSString *)number
{
    self = [super init];
    if (self) {
        
        self.empName = name;
        self.empDesignation = design;
        self.empAge = age;
        self.empMobileNumber = number;
    }
    return self;
}


@end
