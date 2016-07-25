//
//  StudentDataModel.m
//  ScroolViewAndTableView
//
//  Created by test on 5/5/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "StudentDataModel.h"

@implementation StudentDataModel

- (instancetype)initWithName:(NSString *)nme usnNumber:(NSString *)usn studentBranch:(NSString *)branch
{
    self = [super init];
    if (self) {
        self.sName = nme;
        self.sNumber = usn;
        self.sBranch = branch;
    }
    return self;
}
@end
