//
//  CAVAlertViewFactory.h
//  CAVAlertView
//
//  Created by Doug on 11/17/12.
//  Copyright (c) 2012 dssDigital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CAVAlertViewCompletionBlock)(NSInteger selectedButtonIndex);

@interface CAVAlertViewFactory : NSObject
// standard UI
+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                               body:(NSString *)body
                       cancelButton:(NSString *)cancel
                  otherButtonTitles:(NSArray *)others // (NSString *)
                         completion:(CAVAlertViewCompletionBlock)completion;
@end
