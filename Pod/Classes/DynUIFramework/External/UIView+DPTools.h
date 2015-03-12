//
//  UIView+DPTools.h
//  OnCue7
//
//  Created by Dan Pourhadi on 7/8/13.
//  Copyright (c) 2013 Dan Pourhadi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DPTools)

- (void)setAutoresizingToFlexibleWidthAndHeight;

- (CGRect)frameInView:(UIView*)view;

- (void)performRecursiveActionForSubviews:(void(^)(UIView *subview, BOOL *stop))subviewActionBlock;

@end
