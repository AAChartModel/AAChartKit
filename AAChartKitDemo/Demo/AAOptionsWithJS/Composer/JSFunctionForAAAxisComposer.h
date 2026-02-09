#import <Foundation/Foundation.h>

@class AAOptions;

NS_ASSUME_NONNULL_BEGIN

@interface JSFunctionForAAAxisComposer : NSObject

+ (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex;

+ (AAOptions *)customYAxisLabels;
+ (AAOptions *)customYAxisLabels2;
+ (AAOptions *)customAreaChartXAxisLabelsTextUnitSuffix1;
+ (AAOptions *)customAreaChartXAxisLabelsTextUnitSuffix2;
+ (AAOptions *)configureTheAxesLabelsFormattersOfDoubleYAxesChart;
+ (AAOptions *)configureTheAxesLabelsFormattersOfDoubleYAxesChart2;
+ (AAOptions *)configureTheAxesLabelsFormattersOfDoubleYAxesChart3;
+ (AAOptions *)customColumnChartXAxisLabelsTextByInterceptTheFirstFourCharacters;
+ (AAOptions *)customSpiderChartStyle;
+ (AAOptions *)customizeEveryDataLabelSinglelyByDataLabelsFormatter;
+ (AAOptions *)customXAxisLabelsBeImages;
+ (AAOptions *)loadImageForAATooltip;

@end

NS_ASSUME_NONNULL_END
