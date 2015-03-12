//
//  UIBezierPath+DynUI.m
//  DynUI-Example
//
//  Created by Dan Pourhadi on 5/26/13.
//  Copyright (c) 2013 Dan Pourhadi. All rights reserved.
//

#import "UIBezierPath+DynUI.h"

@implementation UIBezierPath (DynUI)

- (void)centerInRect:(CGRect)rect
{	
	UIBezierPath *path = self;
	
	CGAffineTransform transform = CGAffineTransformMakeTranslation(-(path.bounds.origin.x)*(1-(1/rect.size.width)), -(path.bounds.origin.y) *(1-(1 / rect.size.height)));
	[path applyTransform:transform];
	
	CGFloat xTrans = rect.origin.x + ((rect.size.width-path.bounds.size.width)/2);
	CGFloat yTrans = rect.origin.y + ((rect.size.height-path.bounds.size.height)/2);
	
	transform = CGAffineTransformMakeTranslation(xTrans, yTrans);
	[path applyTransform:transform];
}

- (void)insetPathRelativeToCurrentBounds:(UIEdgeInsets)insets
{
	CGFloat xScale = 1 / self.bounds.size.width;
    CGFloat yScale = 1 / self.bounds.size.height;
	
	CGFloat xDiff = insets.left + insets.right;
	CGFloat yDiff = insets.top + insets.bottom;
	
    xScale = 1 - (xDiff * xScale);
    yScale = 1 - (yDiff * yScale);
	
    CGAffineTransform transform = CGAffineTransformMakeScale(xScale, yScale);
	
    transform = CGAffineTransformTranslate(transform, insets.left, insets.top);
	
	[self applyTransform:transform];
}

- (void)fitInSize:(CGSize)size
{
    UIBezierPath *path = self;
   	if (path.bounds.size.width > path.bounds.size.height) {
		if (path.bounds.size.height > size.height) {
			CGFloat scale = size.height / path.bounds.size.height;
			
			CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
			
			[path applyTransform:transform];
			
			transform = CGAffineTransformMakeTranslation(-(path.bounds.origin.x)*(1-(1/path.bounds.size.width)), -(path.bounds.origin.y) *(1-(1 / path.bounds.size.height)));
			
			[path applyTransform:transform];
		}
		[path centerInRect:CGRectMake(0, 0, size.width, size.height)];
        return;
	}
	
	if (path.bounds.size.width > size.width) {
		
		CGFloat scale = size.width / path.bounds.size.width;
		
		CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
		
		[path applyTransform:transform];
		
		transform = CGAffineTransformMakeTranslation(-(path.bounds.origin.x)*(1-(1/path.bounds.size.width)), -(path.bounds.origin.y) *(1-(1 / path.bounds.size.height)));
		
		[path applyTransform:transform];
	}
	[path centerInRect:CGRectMake(0, 0, size.width, size.height)];


}

@end
