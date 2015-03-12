//
//  NSString+DYN.m
//  TheQ
//
//  Created by Dan Pourhadi on 5/6/13.
//
//

#import "NSString+DynUI.h"
#import "DYNDefines.h"
#import "DynUI.h"
@implementation NSString (DynUI)

- (void)dyn_drawAtPoint:(CGPoint)point forWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode withStyleNamed:(NSString *)textStyle {
    DYNTextStyle *style = [[DYNManager sharedInstance] textStyleForName:textStyle];
    
    if (style.shadowOffset.width > 0 && style.shadowOffset.height > 0) {
        [style.shadowColor.color set];
        CGPoint offsetPoint = point;
        offsetPoint.x = point.x + style.shadowOffset.width;
        offsetPoint.y = point.y + style.shadowOffset.height;
        
        [self drawInRect:CGRectMake(offsetPoint.x, offsetPoint.y, width, style.font.lineHeight) withAttributes:@{NSFontAttributeName:style.font, NSForegroundColorAttributeName:style.shadowColor.color}];
        //     [self drawAtPoint:offsetPoint forWidth:width withFont:style.font lineBreakMode:lineBreakMode];
    }
    
    [style.textColor.color set];
    
    [self drawInRect:CGRectMake(point.x, point.y, width, style.font.lineHeight) withAttributes:@{NSFontAttributeName:style.font, NSForegroundColorAttributeName:style.textColor.color}];

    // [self drawAtPoint:point forWidth:width withFont:style.font lineBreakMode:lineBreakMode];
}

- (void)dyn_drawInRect:(CGRect)rect lineBreakMode:(NSLineBreakMode)lineBreakMode withStyleNamed:(NSString *)textStyle {
    DYNTextStyle *style = [[DYNManager sharedInstance] textStyleForName:textStyle];
    [self dyn_drawInRect:rect lineBreakMode:lineBreakMode withStyle:style];
}

- (void)dyn_drawInRect:(CGRect)rect lineBreakMode:(NSLineBreakMode)lineBreakMode withStyle:(DYNTextStyle *)style {
    NSMutableParagraphStyle *paraStyle = [NSMutableParagraphStyle new];
    paraStyle.alignment = style.alignment;
    
    
    if (style.shadowOffset.width > 0 && style.shadowOffset.height > 0) {
        [style.shadowColor.color set];
        CGRect offsetRect = rect;
        offsetRect.origin.x = rect.origin.x + style.shadowOffset.width;
        offsetRect.origin.y = rect.origin.y + style.shadowOffset.height;
        
        
        [self drawInRect:offsetRect withAttributes:@{NSFontAttributeName:style.font, NSForegroundColorAttributeName:style.shadowColor.color, NSParagraphStyleAttributeName:paraStyle}];

        //  [self drawInRect:offsetRect withFont:style.font lineBreakMode:lineBreakMode alignment:style.alignment];
    }
    
    [style.textColor.color set];
    
    [self drawInRect:rect withAttributes:@{NSFontAttributeName:style.font, NSForegroundColorAttributeName:style.shadowColor.color, NSParagraphStyleAttributeName:paraStyle}];

    // [self drawInRect:rect withFont:style.font lineBreakMode:lineBreakMode alignment:style.alignment];
}

@end
