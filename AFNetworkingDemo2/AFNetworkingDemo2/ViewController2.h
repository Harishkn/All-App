//
//  ViewController2.h
//  AFNetworkingDemo2
//
//  Created by test on 6/30/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
@protocol customDelegate <NSObject>

-(void)sessionManager:(NSDictionary*)apiDictionary;

@end
@interface ViewController2 : ViewController

@property (nonatomic,weak) id <customDelegate>delegate;
-(void)apiDictionary;
@end
