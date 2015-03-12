//
//  UIView+DPTools.m
//  OnCue7
//
//  Created by Dan Pourhadi on 7/8/13.
//  Copyright (c) 2013 Dan Pourhadi. All rights reserved.
//

#import "UIView+DPTools.h"
#import "JRSwizzle.h"
@implementation UIView (DPTools)

- (void)setAutoresizingToFlexibleWidthAndHeight
{
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (CGRect)frameInView:(UIView*)view
{
    return [self.superview convertRect:self.frame toView:view];
}

- (void)performRecursiveActionForSubviews:(void(^)(UIView *subview, BOOL *stop))subviewActionBlock
{
    for (UIView *sub in self.subviews) {
        if (subviewActionBlock) {
            BOOL shouldStop = NO;
            subviewActionBlock(self, &shouldStop);
            [sub performRecursiveActionForSubviews:^(UIView *subview, BOOL *stop) {
                subviewActionBlock(subview, stop);

                if (stop) {
                    return;
                }
            }];
        }
    }
}


@end
