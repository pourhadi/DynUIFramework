//
//  UIBezierPath+DynUI.h
//  DynUI-Example
//
//  Created by Dan Pourhadi on 5/26/13.
//  Copyright (c) 2013 Dan Pourhadi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIBezierPath (DynUI)

- (void)centerInRect:(CGRect)rect;
- (void)insetPathRelativeToCurrentBounds:(UIEdgeInsets)insets;

- (void)fitInSize:(CGSize)size;
@end
