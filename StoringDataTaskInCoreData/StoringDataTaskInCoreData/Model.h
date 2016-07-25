//
//  Model.h
//  StoringDataTaskInCoreData
//
//  Created by test on 5/17/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property(strong,nonatomic)NSString *name,*track;
-(instancetype)initWithName:(NSString*)aname trackName:(NSString*)atrackName;

@end
