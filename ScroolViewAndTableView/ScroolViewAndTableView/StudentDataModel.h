//
//  StudentDataModel.h
//  ScroolViewAndTableView
//
//  Created by test on 5/5/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentDataModel : NSObject

@property(strong,nonatomic)NSString* sName;
@property(strong,nonatomic)NSString* sNumber;
@property(strong,nonatomic)NSString* sBranch;

-(instancetype)initWithName:(NSString*)nme usnNumber:(NSString*)usn studentBranch:(NSString*)branch;
@end
