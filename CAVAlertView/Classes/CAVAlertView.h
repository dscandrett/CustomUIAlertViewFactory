//
//  CAVAlertView.h
//  CAVAlertView
//
//  Created by Doug on 11/17/12.
//  Copyright (c) 2012 dssDigital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CAVAlertViewFactory.h"

@class CAVAlertView;
@class CAVAlertViewFactory;

@protocol CAVAlertViewProtocol <NSObject>
@required
- (void)alertViewDidChooseButtonAtIndex:(NSInteger)index withObject:(id)obj;
@end

@interface CAVAlertView : UIView <CAVAlertViewProtocol>
- (void)showWithCompletion:(CAVAlertViewCompletionBlock)completion;
@end


