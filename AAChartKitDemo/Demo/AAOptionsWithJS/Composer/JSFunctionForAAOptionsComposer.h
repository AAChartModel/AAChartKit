#import <Foundation/Foundation.h>

@class AAOptions;

NS_ASSUME_NONNULL_BEGIN

@interface JSFunctionForAAOptionsComposer : NSObject

+ (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex;

+ (AAOptions *)customDoubleXAxesChart;
+ (AAOptions *)disableColumnChartUnselectEventEffectBySeriesPointEventClickFunction;
+ (AAOptions *)customizeEveryDataLabelSinglelyByDataLabelsFormatter;
+ (AAOptions *)configureColorfulDataLabelsForPieChart;
+ (AAOptions *)customizeCrosshairsStyle;

@end

NS_ASSUME_NONNULL_END
