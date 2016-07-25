//
//  ViewController.h
//  Delegate1to2demo
//
//  Created by test on 6/28/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol customDelegate <NSObject>

-(void)sendData:(NSString*)name;

@end
@interface ViewController : UIViewController
@property(nonatomic,weak) id <customDelegate> delegate;

@end

