//
//  AAJsonConverter.h
//  AAChartKit
//
//  Created by An An on 17/1/9.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import <Foundation/Foundation.h>

@interface AAJsonConverter : NSObject

/**
 Get pure options string

 @param optionsObject Instance object of AAOptions
 @return Pure options string without "\r" && "\n"
 */
+ (NSString *)getPureOptionsString:(id)optionsObject;


/**
 Get pure series string

 @param series Series array of AAOptions
 @return Pure series string without "\r" && "\n"
 */
+ (NSString *)getPureSeriesString:(NSArray<NSDictionary*> *)series;

@end 
