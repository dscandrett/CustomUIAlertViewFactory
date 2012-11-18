//
//  CAVViewController.m
//  CAVAlertView
//
//  Created by Doug on 11/17/12.
//  Copyright (c) 2012 dssDigital. All rights reserved.
//

#import "CAVViewController.h"
#import "CAVAlertViewFactory.h"
#import <QuartzCore/QuartzCore.h>

@interface CAVViewController ()
- (void)updateDisplayForIndex:(NSInteger)index;
@end

@implementation CAVViewController

- (IBAction)doShowStandardAlert:(UIButton *)sender {
    [CAVAlertViewFactory alertViewWithTitle:@"Standard Title"
                                       body:@"This is a standard alert"
                               cancelButton:@"Cancel"
                          otherButtonTitles:@[@"Okay",@"Not okay"]
                                 completion:^(NSInteger selectedButtonIndex) {
                                     [self updateDisplayForIndex:selectedButtonIndex];
                                 }];
}

- (IBAction)doShowCustomAlert:(UIButton *)sender {
    
}

- (void)updateDisplayForIndex:(NSInteger)index {
    NSString *display = [NSString stringWithFormat:@"User picked button with index %i",index];
    
    CATransition *anim = [CATransition animation];
    anim.duration = .3;
    anim.type = kCATransitionPush;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    self.displayLabel.text = display;
    [self.displayLabel.layer addAnimation:anim forKey:nil];
}

- (void)viewDidUnload {
    [self setDisplayLabel:nil];
    [super viewDidUnload];
}
@end
