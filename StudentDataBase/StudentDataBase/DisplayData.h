//
//  DisplayData.h
//  StudentDataBase
//
//  Created by test on 5/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"

@interface DisplayData : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end
