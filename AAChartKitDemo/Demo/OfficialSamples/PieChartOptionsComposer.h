#import <Foundation/Foundation.h>

@class AAOptions;

NS_ASSUME_NONNULL_BEGIN

@interface PieChartOptionsComposer : NSObject

+ (AAOptions *)basicPieChart;
+ (AAOptions *)basicPieChartWithLegend;
+ (AAOptions *)basicPieChartWithGradientColor;
+ (AAOptions *)basicPieChartWithGradientColor2;
+ (AAOptions *)basicPieChartWithMonochromeColor;
+ (AAOptions *)customPieChartTitlePosition;

@end

NS_ASSUME_NONNULL_END
