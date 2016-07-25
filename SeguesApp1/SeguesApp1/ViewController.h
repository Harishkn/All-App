//
//  ViewController.h
//  SeguesApp1
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameText;

@property (weak, nonatomic) IBOutlet UITextField *passwordText;


@property (strong,nonatomic) NSMutableArray* namesList;

@property (strong,nonatomic)NSMutableArray* passwordList;

@property (strong,nonatomic)NSString* nme;

@property (strong,nonatomic)NSString* pwd;
@end

