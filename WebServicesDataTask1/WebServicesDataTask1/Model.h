//
//  Model.h
//  WebServicesDataTask1
//
//  Created by test on 5/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property(strong,nonatomic)NSString *name,*track;
-(instancetype)initWithName:(NSString*)aname trackName:(NSString*)atrackName;
@end
