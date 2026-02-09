#import <Foundation/Foundation.h>

@class AAOptions;

NS_ASSUME_NONNULL_BEGIN

@interface JSFunctionForAATooltipComposer : NSObject

+ (AAOptions *)customAreaChartTooltipStyleWithSimpleFormatString;
+ (AAOptions *)customAreaChartTooltipStyleWithDifferentUnitSuffix;
+ (AAOptions *)customAreaChartTooltipStyleWithColorfulHtmlLabels;
+ (AAOptions *)customLineChartTooltipStyleWhenValueBeZeroDoNotShow;
+ (AAOptions *)customStackedAndGroupedColumnChartTooltip;
+ (AAOptions *)configureSpecialStyleTrianglePolarChart;
+ (AAOptions *)customArearangeChartTooltip;
+ (AAOptions *)customLineChartOriginalPointPositionByConfiguringXAxisFormatterAndTooltipFormatter;
+ (AAOptions *)customTooltipWhichDataSourceComeFromOutSideRatherThanSeries;
+ (AAOptions *)customAreasplineChartTooltipStyleByDivWithCSS;

@end

NS_ASSUME_NONNULL_END
