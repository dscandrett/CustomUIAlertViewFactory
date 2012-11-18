//
//  CAVDemoAlert.m
//  CAVAlertView
//
//  Created by Doug on 11/18/12.
//  Copyright (c) 2012 dssDigital. All rights reserved.
//

#import "CAVDemoAlert.h"
#import <QuartzCore/QuartzCore.h>

@interface UIView(xibLoading)
+ (UIView *)loadFromXib;
@end
@implementation UIView(xibLoading)
+ (UIView *)loadFromXib {
    NSArray* elements = [[NSBundle mainBundle] loadNibNamed: NSStringFromClass([self class]) owner: nil options: nil];
    for (id view in elements) {
        if ([view isKindOfClass:[self class]]) {
            return view;
        }
    }
    return nil;
}
@end

//

@implementation CAVDemoAlert
+ (CAVDemoAlert *)demoAlert {
    CAVDemoAlert *demo = (CAVDemoAlert *)[CAVDemoAlert loadFromXib];
    demo.frame = CGRectMake(0.0f, 0.0f, 200.0f, 200.0f);
    demo.layer.cornerRadius = 4.0f;
    return demo;
}

#pragma mark Actions
- (IBAction)doButtonPress:(UIButton *)sender {
    [self alertViewDidChooseButtonAtIndex:sender.tag withObject:nil];
}

@end
