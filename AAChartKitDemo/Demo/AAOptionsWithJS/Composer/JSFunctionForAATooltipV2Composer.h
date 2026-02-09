#import <Foundation/Foundation.h>

@class AAOptions;

NS_ASSUME_NONNULL_BEGIN

@interface JSFunctionForAATooltipV2Composer : NSObject

+ (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex;

+ (AAOptions *)customTooltipPostionerFunction;
+ (AAOptions *)fixedTooltipPositionByCustomPositionerFunction;
+ (AAOptions *)customPlotAreaOutsideComlicatedTooltipStyle;
+ (AAOptions *)makePieChartShow0Data;
+ (AAOptions *)customColumnChartBorderStyleAndStatesHoverColor;
+ (AAOptions *)customizeTooltipShapeAndShadowBeSpecialStyle;
+ (AAOptions *)specialStyleForAreaChart;

@end

NS_ASSUME_NONNULL_END
