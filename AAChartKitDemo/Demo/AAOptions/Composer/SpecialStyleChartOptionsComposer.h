//
//  SpecialStyleChartOptionsComposer.h
//  AAChartKitDemo
//

#import <Foundation/Foundation.h>
#import "AAChartKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface SpecialStyleChartOptionsComposer : NSObject

+ (AAOptions *)everySingleColumnHasGrayBackground;
+ (AAOptions *)everySingleColumnHasWhiteEmptyBorderLineBackground;
+ (AAOptions *)colorfulSpecialStyleColumnChart;

@end

NS_ASSUME_NONNULL_END
