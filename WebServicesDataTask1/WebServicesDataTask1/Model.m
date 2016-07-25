//
//  Model.m
//  WebServicesDataTask1
//
//  Created by test on 5/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "Model.h"

@implementation Model
- (instancetype)initWithName:(NSString *)aname trackName:(NSString *)atrackName
{
    self = [super init];
    if (self) {
        self.name = aname;
        self.track = atrackName;
    }
    return self;
}

@end
