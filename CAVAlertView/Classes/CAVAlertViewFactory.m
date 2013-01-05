//
//  CAVAlertViewFactory.m
//  CAVAlertView
//
//  Created by Doug on 11/17/12.
//  Copyright (c) 2012 dssDigital. All rights reserved.
//

#import "CAVAlertViewFactory.h"
#import "CAVAlertView.h"

@interface BlockAlertView : UIAlertView
@property (nonatomic,copy) CAVAlertViewCompletionBlock completionBlock;
@end
@implementation BlockAlertView
@end

//

@interface CAVAlertViewFactory() <UIAlertViewDelegate>
@property (nonatomic,strong) NSMutableArray *alerts;
@end

//

@implementation CAVAlertViewFactory
#pragma mark Standard UI Implementation
+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                               body:(NSString *)body
                       cancelButton:(NSString *)cancel
                  otherButtonTitles:(NSArray *)others // (NSString *)
                         completion:(CAVAlertViewCompletionBlock)completion {
    
    CAVAlertViewFactory *factory = [CAVAlertViewFactory sharedCAVAlertViewFactory];
    
    BlockAlertView *alert = [[BlockAlertView alloc] initWithTitle:title
                                                          message:body
                                                         delegate:factory
                                                cancelButtonTitle:cancel
                                                otherButtonTitles:nil];
    alert.completionBlock = completion;
    if (others) {
        for (NSString *alternateTitle in others) {
            [alert addButtonWithTitle:alternateTitle];
        }
    }
    
    // clean all other alerts to prevent odd behavior
    for (BlockAlertView *oldAlert in factory.alerts) {
        oldAlert.completionBlock = nil;
    }
    [factory.alerts removeAllObjects];
    [factory.alerts addObject:alert];
    
    [alert show];
    
    return alert;
}

#pragma mark Standard AlertViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    BlockAlertView *alert = (BlockAlertView *)alertView;
    if (alert.completionBlock) {
        alert.completionBlock(buttonIndex,nil);
    }
}

#pragma mark Custom UI Convenience
+ (void)showCAVAlert:(CAVAlertView *)customAlert
      withCompletion:(CAVAlertViewCompletionBlock)completion {
    [customAlert showWithCompletion:completion];
}

#pragma mark Singleton
+ (CAVAlertViewFactory *)sharedCAVAlertViewFactory {
    static dispatch_once_t onceQueue;
    static CAVAlertViewFactory *_instance = nil;
    
    dispatch_once(&onceQueue, ^{
        _instance = [[self alloc] init];
        _instance.alerts = [[NSMutableArray alloc] init];
    });
    return _instance;
}
@end
