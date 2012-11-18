//
//  CAVAlertView.m
//  CAVAlertView
//
//  Created by Doug on 11/17/12.
//  Copyright (c) 2012 dssDigital. All rights reserved.
//

#import "CAVAlertView.h"
#import <QuartzCore/QuartzCore.h>

@interface CAVAlertView() {
    UIView *_mask;
}
@property (nonatomic,copy) CAVAlertViewCompletionBlock completionBlock;
- (CAKeyframeAnimation *)bubbleAnimation;
@end

@implementation CAVAlertView
- (void)alertViewDidChooseButtonAtIndex:(NSInteger)index withObject:(id)obj {

    [UIView animateWithDuration:.3
                     animations:^{
                         self.alpha = 0.0f;
                         _mask.alpha = 0.0f;
                     } completion:^(BOOL finished) {
                         [self removeFromSuperview];
                         [_mask removeFromSuperview];
                         _mask = nil;
                     }];
    
    self.completionBlock(index,obj);
}

- (void)showWithCompletion:(CAVAlertViewCompletionBlock)completion {
    self.completionBlock = completion;
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIView *firstChild = [window subviews][0];
    if (!_mask) {
        _mask = [[UIView alloc] initWithFrame:firstChild.bounds];
        _mask.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _mask.backgroundColor = [UIColor blackColor];
        _mask.alpha = 0.0f;
    }
    [firstChild addSubview:_mask];
    
    self.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    self.center = CGPointMake(firstChild.bounds.size.width / 2, firstChild.bounds.size.height / 2);
    self.frame = CGRectIntegral(self.frame);
    [firstChild addSubview:self];

    CAKeyframeAnimation *anim = [self bubbleAnimation];
    [self.layer addAnimation:anim forKey:nil];
    
    [UIView animateWithDuration:.2
                     animations:^{
                         self.alpha = 1.0f;
                         _mask.alpha = .7f;
                     } completion:^(BOOL finished) {
                     }];
}

#pragma mark Animation
- (CAKeyframeAnimation *)bubbleAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation
                                      animationWithKeyPath:@"transform"];
    
    CATransform3D scale0 = CATransform3DMakeScale(0.2f, 0.2f, 1.0f);
    CATransform3D scale1 = CATransform3DMakeScale(0.5f, 0.5f, 1.0f);
    CATransform3D scale2 = CATransform3DMakeScale(1.2f, 1.2f, 1.0f);
    CATransform3D scale3 = CATransform3DMakeScale(0.9f, 0.9f, 1.0f);
    CATransform3D scale4 = CATransform3DMakeScale(1.0f, 1.0f, 1.0f);
    
    NSArray *frameValues = @[[NSValue valueWithCATransform3D:scale0],
                            [NSValue valueWithCATransform3D:scale1],
                            [NSValue valueWithCATransform3D:scale2],
                            [NSValue valueWithCATransform3D:scale3],
                            [NSValue valueWithCATransform3D:scale4]];
    
    [animation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects:
                           @0.1,
                           @0.0,
                           @0.5,
                           @0.9,
                           @1.0,
                           nil];
    [animation setKeyTimes:frameTimes];
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    animation.duration = .3;
    
    return animation;
}

@end
