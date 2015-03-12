//
//  DYNTextStyle.m
//  TheQ
//
//  Created by Dan Pourhadi on 5/4/13.
//
//

#import "DYNTextStyle.h"
#import "DYNDefines.h"
#import <objc/runtime.h>
#import "DynUI.h"
@implementation DYNTextStyle

+ (DYNTextStyle *)textStyleForName:(NSString *)styleName {
    return [[DYNManager sharedInstance] textStyleForName:styleName];
}

- (id)copyWithZone:(NSZone *)zone {
    id theCopy = [super copyWithZone:zone];  // use designated initializer
	
    [theCopy setTextColor:[self.textColor copy]];
    [theCopy setFont:[self.font copy]];
    [theCopy setShadowOffset:self.shadowOffset];
    [theCopy setShadowColor:[self.shadowColor copy]];
    [theCopy setAlignment:self.alignment];
    [theCopy setFontSizeString:[self.fontSizeString copy]];
    [theCopy setFontSizeType:self.fontSizeType];
	
    return theCopy;
}

- (id)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.name = [dict objectForKey:kDYNStyleNameKey];
        self.font = [UIFont fontWithName:[dict objectForKey:kDYNFontNameKey] size:[[dict objectForKey:kDYNFontSizeKey] floatValue]];
        self.textColor = [[DYNColor alloc] initWithDictionary:[dict objectForKey:kDYNTextColorKey]];
        self.shadowColor = [[DYNColor alloc] initWithDictionary:[dict objectForKey:kDYNShadowColorKey]];
        self.shadowOffset = CGSizeMake([[dict objectForKey:kDYNShadowXOffsetKey] floatValue], oppositeSign([[dict objectForKey:kDYNShadowYOffsetKey] floatValue]));
        NSInteger alignInt = [[dict objectForKey:kDYNAlignmentKey] intValue];
        if (alignInt == 0) {
            self.alignment = NSTextAlignmentLeft;
        } else if (alignInt == 1) {
            self.alignment = NSTextAlignmentCenter;
        } else if (alignInt == 2) {
            self.alignment = NSTextAlignmentRight;
        }
        self.fontSizeString = [dict objectForKey:kDYNFontSizeStringKey];
        self.fontSizeType = [[dict objectForKey:kDYNFontSizeTypeKey] intValue];
		
		self.inheritFontSize = [[dict objectForKey:kDYNInheritFontSizeKey] boolValue];
		self.inheritAlignment = [[dict objectForKey:kDYNInheritAlignmentKey] boolValue];
    }
	
    return self;
}

- (void)applyToLabel:(UILabel *)label {
    objc_setAssociatedObject(label, kDPTextStyleKey, self.name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = self.textColor.color;
	
    CGFloat fontSize = self.font.pointSize;
    if (self.fontSizeType == DYNFontSizeTypeRelative && !self.inheritFontSize) {
        if (self.fontSizeString) {
            if ([self.fontSizeString hasSuffix:@"%"]) {
                NSRange range = [self.fontSizeString rangeOfString:@"%"];
                NSString *chopped = [self.fontSizeString substringToIndex:range.location];
                CGFloat percent = [chopped floatValue];
                percent /= 100;
                fontSize = label.frame.size.height * percent;
            }
        }
    } else if (self.inheritFontSize) {
		fontSize = label.font.pointSize;
	}
	
	NSTextAlignment alignment = self.alignment;
	if (self.inheritAlignment) {
		alignment = label.textAlignment;
		if (alignment == NSTextAlignmentNatural || alignment == NSTextAlignmentJustified) {
			alignment = self.alignment;
		}
	}
	
    label.font = [UIFont fontWithName:self.font.fontName size:fontSize];
    label.shadowColor = self.shadowColor.color;
    label.shadowOffset = self.shadowOffset;
    label.textAlignment = alignment;
}

- (void)applyToTextField:(UITextField *)textField {
    CGFloat fontSize = self.font.pointSize;
    if (self.fontSizeType == DYNFontSizeTypeRelative) {
        if (self.fontSizeString) {
            if ([self.fontSizeString hasSuffix:@"%"]) {
                NSRange range = [self.fontSizeString rangeOfString:@"%"];
                NSString *chopped = [self.fontSizeString substringToIndex:range.location];
                CGFloat percent = [chopped floatValue];
                percent /= 100;
                fontSize = textField.frame.size.height * percent;
            }
        }
    } else if (self.inheritFontSize) {
		fontSize = textField.font.pointSize;
	}
	
	NSTextAlignment alignment = self.alignment;
	if (self.inheritAlignment) {
		alignment = textField.textAlignment;
		if (alignment == NSTextAlignmentNatural || alignment == NSTextAlignmentJustified) {
			alignment = self.alignment;
		}
	}
	
	
    textField.font = [UIFont fontWithName:self.font.fontName size:fontSize];
    textField.textColor = self.textColor.color;
    textField.textAlignment = alignment;
}

- (NSDictionary *)titleTextAttributes {
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = self.shadowColor.color;
    shadow.shadowOffset = self.shadowOffset;
    return @{ NSFontAttributeName: self.font,
              NSForegroundColorAttributeName: self.textColor.color,
              NSShadowAttributeName:shadow};
}

- (void)applyToButton:(UIButton *)button forState:(UIControlState)controlState {
    [button setTitleColor:self.textColor.color forState:controlState];
	
    CGFloat fontSize = floorf(self.font.pointSize);
    if (self.fontSizeType == DYNFontSizeTypeRelative) {
        if (self.fontSizeString) {
            if ([self.fontSizeString hasSuffix:@"%"]) {
                NSRange range = [self.fontSizeString rangeOfString:@"%"];
                NSString *chopped = [self.fontSizeString substringToIndex:range.location];
                CGFloat percent = [chopped floatValue];
                percent /= 100;
                fontSize = floorf(button.frame.size.height * percent);
            }
        }
    } else if (self.inheritFontSize) {
		fontSize = button.titleLabel.font.pointSize;
	}
	
	NSTextAlignment alignment = self.alignment;
	if (self.inheritAlignment) {
		alignment = button.titleLabel.textAlignment;
		if (alignment == NSTextAlignmentNatural || alignment == NSTextAlignmentJustified) {
			alignment = self.alignment;
		}
	}
	
	
    UIFont *font = [UIFont fontWithName:self.font.fontName size:fontSize];
	
    CGSize size = [button.titleLabel.text sizeWithFont:font];
	
    if (size.width > button.frame.size.width - 10 && !CGRectIsEmpty(button.frame)) {
        BOOL tooBig = YES;
        while (tooBig) {
            fontSize -= 1;
            font = [UIFont fontWithName:self.font.fontName size:fontSize];
            size = [button.titleLabel.text sizeWithFont:font];
            if (size.width < button.frame.size.width - 10) {
                tooBig = NO;
            }
        }
    }
	
    button.titleLabel.font = font;
    [button setTitleShadowColor:self.shadowColor.color forState:controlState];
    button.titleLabel.shadowOffset = self.shadowOffset;
    button.titleLabel.textAlignment = alignment;
}

@end
