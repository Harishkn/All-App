//
//  EmployeeDetails.h
//  EmployeeappUsingMvc
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeDetails : NSObject

@property (strong,nonatomic)NSString* empName,*empDesignation,*empAge,*empMobileNumber;

-(instancetype)initWithName:(NSString*)name designation:(NSString*)design age:(NSString*)age mobileNumber:(NSString*)number;
@end
