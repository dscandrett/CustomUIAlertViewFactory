//
//  CAVAlertViewFactory.m
//  CAVAlertView
//
//  Created by Doug on 11/17/12.
//  Copyright (c) 2012 dssDigital. All rights reserved.
//

#import "CAVAlertViewFactory.h"


@implementation CAVAlertViewFactory
#pragma mark Standard UI Implementation
+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                               body:(NSString *)body
                       cancelButton:(NSString *)cancel
                  otherButtonTitles:(NSArray *)others // (NSString *)
                         completion:(CAVAlertViewCompletionBlock)completion {
    return nil;
}
@end
