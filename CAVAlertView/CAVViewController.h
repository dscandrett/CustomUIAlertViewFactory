//
//  CAVViewController.h
//  CAVAlertView
//
//  Created by Doug on 11/17/12.
//  Copyright (c) 2012 dssDigital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAVViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
- (IBAction)doShowStandardAlert:(UIButton *)sender;
- (IBAction)doShowCustomAlert:(UIButton *)sender;
@end
