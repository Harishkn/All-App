//
//  ViewController2.h
//  DelegateDemo
//
//  Created by test on 6/28/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@protocol cutomDelegate <NSObject>

-(void)empName:(NSString*)name;

@end


@interface ViewController2 : UIViewController
@property(nonatomic,weak) id <cutomDelegate>delegate;

@end
