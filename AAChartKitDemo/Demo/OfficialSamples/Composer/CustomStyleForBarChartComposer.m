#import "CustomStyleForBarChartComposer.h"
#import "AAChartKit.h"
#import "CustomStyleForColumnChartComposer.h"

@implementation CustomStyleForBarChartComposer

+ (AAChartModel *)colorfulBarChart {
    return [CustomStyleForColumnChartComposer colorfulColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)colorfulGradientColorBarChart {
    return [CustomStyleForColumnChartComposer colorfulGradientColorColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)discontinuousDataBarChart {
    return [CustomStyleForColumnChartComposer discontinuousDataColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)randomColorfulBarChart {
    return [CustomStyleForColumnChartComposer randomColorfulColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)noneStackingPolarBarChart {
    return [CustomStyleForColumnChartComposer noneStackingPolarColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)normalStackingPolarBarChart {
    return [CustomStyleForColumnChartComposer normalStackingPolarColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)percentStackingPolarBarChart {
    return [CustomStyleForColumnChartComposer percentStackingPolarColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)specialStyleForTheSingleDataElementOfBarChart {
    return [CustomStyleForColumnChartComposer specialStyleForTheSingleDataElementOfColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)noMoreGroupingAndOverlapEachOtherBarChart {
    return [CustomStyleForColumnChartComposer noMoreGroupingAndOverlapEachOtherColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)noMoreGroupingAndNestedBarChart {
    return [CustomStyleForColumnChartComposer noMoreGroupingAndNestedColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)topRoundedCornersStackingBarChart {
    return [CustomStyleForColumnChartComposer topRoundedCornersStackingColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)freeStyleRoundedCornersStackingBarChart {
    return [CustomStyleForColumnChartComposer freeStyleRoundedCornersStackingColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)customBorderStyleAndStatesHoverColorBarChart {
    return [CustomStyleForColumnChartComposer customBorderStyleAndStatesHoverColorColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)negativeDataMixedPositiveDataBarChart {
    return [CustomStyleForColumnChartComposer negativeDataMixedPositiveDataColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)customAnimationForBarChart {
    return [CustomStyleForColumnChartComposer customAnimationForColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)configureNegativeColorMixedBarChart {
    return [CustomStyleForColumnChartComposer configureNegativeColorMixedColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)customSingleDataElementSpecialStyleForBarChart {
    return [CustomStyleForColumnChartComposer customSingleDataElementSpecialStyleForColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)customHoverColorAndSelectColorForBarChart {
    return [CustomStyleForColumnChartComposer customHoverColorAndSelectColorForColumnChart].chartTypeSet(AAChartTypeBar);
}

+ (AAChartModel *)customNormalStackingChartDataLabelsContentAndStyleForBarChart {
    return [CustomStyleForColumnChartComposer customNormalStackingChartDataLabelsContentAndStyleForColumnChart].chartTypeSet(AAChartTypeBar);
}

@end
