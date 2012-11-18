//
//  CAVAlertViewFactory.h
//  CAVAlertView
//
//  Created by Doug on 11/17/12.
//  Copyright (c) 2012 dssDigital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CAVAlertView;

typedef void (^CAVAlertViewCompletionBlock)(NSInteger selectedButtonIndex,id customObj);

@interface CAVAlertViewFactory : NSObject
// standard UI
+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                               body:(NSString *)body
                       cancelButton:(NSString *)cancel
                  otherButtonTitles:(NSArray *)others // (NSString *)
                         completion:(CAVAlertViewCompletionBlock)completion;
// custom UI Convenience
+ (void)showCAVAlert:(CAVAlertView *)customAlert
      withCompletion:(CAVAlertViewCompletionBlock)completion;
@end
