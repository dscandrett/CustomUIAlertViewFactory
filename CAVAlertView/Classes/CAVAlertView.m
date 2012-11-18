//
//  CAVAlertView.m
//  CAVAlertView
//
//  Created by Doug on 11/17/12.
//  Copyright (c) 2012 dssDigital. All rights reserved.
//

#import "CAVAlertView.h"

@interface CAVAlertView()
@property (nonatomic,copy) CAVAlertViewCompletionBlock completionBlock;
@end

@implementation CAVAlertView
- (void)alertViewDidChooseButtonAtIndex:(NSInteger)index withObject:(id)obj {
    
    // hide window backdrop
    // hide alert
    
    self.completionBlock(index,obj);
}
- (void)showWithCompletion:(CAVAlertViewCompletionBlock)completion {
    self.completionBlock = completion;
    
    // add window backdrop
    // present alert
}
@end
