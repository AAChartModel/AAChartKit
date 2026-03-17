//
//  DrawChartWithAAOptionsComposer.h
//  AAChartKitDemo
//

#import <Foundation/Foundation.h>
#import "AAChartKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface DrawChartWithAAOptionsComposer : NSObject

+ (AAOptions *)configureTheAAOptionsOfAreaChart;
+ (AAOptions *)configureTheAAOptionsOfSpecialNestedColumnChart;
+ (AAOptions *)configureTheNoGapColunmChart;
+ (AAOptions *)adjustChartLeftAndRightMargin;
+ (AAOptions *)configureChartWithBackgroundImage;
+ (AAOptions *)adjustChartSeriesDataAccuracy;
+ (AAOptions *)adjustGroupPaddingForPolarChart;
+ (AAOptions *)customStyleStackedColumnChart;
+ (AAOptions *)disableChartAnimation;
+ (AAOptions *)customChartLengendItemStyle;
+ (AAOptions *)yAxisOnTheRightSideChart;
+ (AAOptions *)configure_DataLabels_XAXis_YAxis_Legend_Style;
+ (AAOptions *)customChartStyleWhenNoData;
+ (AAOptions *)customChartStyleWhenEveryDataValueIsZero;
+ (AAOptions *)disableSpineChartHoverAnimationEffect;
+ (AAOptions *)configureBoxplotChartWithSpecialStyle;
+ (AAOptions *)toFixHighchartsWithAThickLineAt0ValuesTheLineIsHalfHidden;
+ (AAOptions *)clipForAASeriesElement;
+ (AAOptions *)configureDoubleYAxesAreasplineMixedColumnChart;

@end

NS_ASSUME_NONNULL_END
