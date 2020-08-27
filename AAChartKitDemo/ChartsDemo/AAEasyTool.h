//
//  AAEasyTool.h
//  AAChartKitDemo
//
//  Created by AnAn on 2018/12/19.
//  Copyright © 2018 Danny boy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AAEasyTool : NSObject

+ (UIColor *)colorWithHexString: (NSString *)color;
+ (NSArray *)configureTheRandomColorArray;
+ (NSArray *)configureTheRandomColorArrayWithColorNumber:(NSInteger)colorNumber;
+ (NSArray *)configureTheConstraintArrayWithSonView:(UIView *)sonView
                                       toFatherView:(UIView *)fatherView;
@end


