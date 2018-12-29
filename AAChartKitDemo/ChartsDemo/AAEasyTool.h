//
//  AAEasyTool.h
//  AAChartKitDemo
//
//  Created by AnAn on 2018/12/19.
//  Copyright © 2018 Danny boy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AAEasyTool : NSObject

+ (UIColor *)colorWithHexString: (NSString *)color;
+ (NSArray *)configureTheRandomColorArray;
+ (NSArray *)configureTheRandomColorArrayWithColorNumber:(NSInteger)colorNumber;

@end

NS_ASSUME_NONNULL_END
