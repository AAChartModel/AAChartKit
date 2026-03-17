//
//  PieChartOptionsComposer.h
//  AAChartKitDemo
//

#import <Foundation/Foundation.h>
#import "AAChartKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface AAPieChartOptionsComposer : NSObject

+ (AAOptions *)configurePieChartTitle;
+ (AAOptions *)adjustPieChartTitleAndDataLabelFontStyle;
+ (AAOptions *)adjustPieChartTitleAndDataLabelFontStyle2;
+ (AAOptions *)configurePieChartFormatProperty;
+ (AAOptions *)doubleLayerHalfPieChart;
+ (AAOptions *)adjustPieChartDataLabelStyleAndPostion;
+ (AAOptions *)showPieChartPointNamePointYAndPointPercentForDataLabels;

@end

NS_ASSUME_NONNULL_END
