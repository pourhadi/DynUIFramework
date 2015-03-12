//
//  UIColor+DPStyle.h
//  TheQ
//
//  Created by Dan Pourhadi on 5/2/13.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (DynUI)

+ (UIColor *)colorFromHex:(NSString *)hex;
+ (UIColor *)colorForVariable:(NSString *)variable;
+ (UIColor *)colorFromCIString:(NSString *)string;
+ (CIColor *)uiColorToCIColor:(UIColor *)color;

- (UIColor*)darkerColor;
- (UIColor*)lighterColor;
- (UIColor*)lightestColor;
- (UIColor*)darkestColor;

+(NSString *)hexValuesFromUIColor:(UIColor *)color;
@end
