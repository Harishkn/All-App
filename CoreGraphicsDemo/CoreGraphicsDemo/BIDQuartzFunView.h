//
//  BIDQuartzFunView.h
//  CoreGraphicsDemo
//
//  Created by test on 6/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDConstants.h"
@interface BIDQuartzFunView : UIView
@property (weak, nonatomic) IBOutlet UISegmentedControl *changeColor;
@property (weak, nonatomic) IBOutlet UISegmentedControl *changeShape;
@property (assign, nonatomic) CGPoint firstTouchLocation;
@property (assign, nonatomic) CGPoint lastTouchLocation;
@property (assign, nonatomic) ShapeType shapeType;
@property (assign, nonatomic) BOOL useRandomColor;
@property (strong, nonatomic) UIColor *currentColor;
@property (strong, nonatomic) UIImage *drawImage;
@end
