//
//  AAEasyTool.m
//  AAChartKitDemo
//
//  Created by AnAn on 2018/12/19.
//  Copyright © 2018 Danny boy. All rights reserved.
//

#import "AAEasyTool.h"

@implementation AAEasyTool
+ (UIColor *)colorWithHexString: (NSString *)color {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

+ (NSArray *)configureTheRandomColorArray {
   return [self configureTheRandomColorArrayWithColorNumber:5];
}

+ (NSArray *)configureTheRandomColorArrayWithColorNumber:(NSInteger)colorNumber {
    NSMutableArray *colorStringArr = [[NSMutableArray alloc]init];
    for (unsigned int i=0; i < colorNumber; i++) {
        unsigned int R = (arc4random() % 256) ;
        unsigned int G = (arc4random() % 256) ;
        unsigned int B = (arc4random() % 256) ;
        NSString *colorStr = [NSString stringWithFormat:@"rgba(%d,%d,%d,0.9)",R,G,B];
        [colorStringArr addObject:colorStr];
    }
    return colorStringArr;
}


- (NSArray *)generateRandomValues {
    unsigned int length = 350;
    NSMutableArray *dataArr = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        unsigned int value = (arc4random() % 500) ;
        [dataArr addObject:@(value)];
    }
    return dataArr;
}

+ (NSArray *)configureTheConstraintArrayWithSonView:(UIView *)sonView
                                       toFatherView:(UIView *)fatherView {
    return @[[NSLayoutConstraint constraintWithItem:sonView
                                          attribute:NSLayoutAttributeLeft
                                          relatedBy:NSLayoutRelationEqual
                                             toItem:fatherView
                                          attribute:NSLayoutAttributeLeft
                                         multiplier:1.0
                                           constant:0],
             [NSLayoutConstraint constraintWithItem:sonView
                                          attribute:NSLayoutAttributeRight
                                          relatedBy:NSLayoutRelationEqual
                                             toItem:fatherView
                                          attribute:NSLayoutAttributeRight
                                         multiplier:1.0
                                           constant:0],
             [NSLayoutConstraint constraintWithItem:sonView
                                          attribute:NSLayoutAttributeTop
                                          relatedBy:NSLayoutRelationEqual
                                             toItem:fatherView
                                          attribute:NSLayoutAttributeTop
                                         multiplier:1.0
                                           constant:88],
             [NSLayoutConstraint constraintWithItem:sonView
                                          attribute:NSLayoutAttributeBottom
                                          relatedBy:NSLayoutRelationEqual
                                             toItem:fatherView
                                          attribute:NSLayoutAttributeBottom
                                         multiplier:1.0
                                           constant:0],
    ];
}


@end
