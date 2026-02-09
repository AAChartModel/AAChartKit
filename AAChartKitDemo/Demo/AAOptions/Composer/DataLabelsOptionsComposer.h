//
//  DataLabelsOptionsComposer.h
//  AAChartKitDemo
//

#import <Foundation/Foundation.h>
#import "AAChartKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataLabelsOptionsComposer : NSObject

+ (AAOptions *)adjustChartDataLabelsStyle;
+ (AAOptions *)customizeEveryDataLabelBySinglely;
+ (AAOptions *)configureStackingColumnChartDataLabelsOverflow;
+ (AAOptions *)configureReversedBarChartDataLabelsStyle;
+ (AAOptions *)configureColumnChartDataLabelsLayout;

@end

NS_ASSUME_NONNULL_END
