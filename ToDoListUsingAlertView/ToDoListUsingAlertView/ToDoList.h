//
//  ToDoList.h
//  ToDoListUsingAlertView
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoList : NSObject

@property(strong,nonatomic)NSString* name;

-(instancetype)initWithName:(NSString*)name;
@end
