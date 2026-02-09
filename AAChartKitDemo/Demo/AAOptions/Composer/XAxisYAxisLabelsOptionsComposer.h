//
//  XAxisYAxisLabelsOptionsComposer.h
//  AAChartKitDemo
//

#import <Foundation/Foundation.h>
#import "AAChartKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface XAxisYAxisLabelsOptionsComposer : NSObject

+ (AAOptions *)configureXAxisLabelsFontColorWithHTMLString;
+ (AAOptions *)configureXAxisLabelsFontColorAndFontSizeWithHTMLString;
+ (AAOptions *)customXAxisLabelsBeImages;
+ (AAOptions *)configureYAxisLabelsNumericSymbolsMagnitudeOfAerasplineChart;

@end

NS_ASSUME_NONNULL_END
