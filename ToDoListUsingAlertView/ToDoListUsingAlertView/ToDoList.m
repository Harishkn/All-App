//
//  ToDoList.m
//  ToDoListUsingAlertView
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ToDoList.h"

@implementation ToDoList


- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        NSLog(@"%@",name);
    }
    return self;
}
@end

