#import "CustomStyleForAreasplineChartComposer.h"
#import "AAChartKit.h"
#import "CustomStyleForAreaChartComposer.h"

@implementation CustomStyleForAreasplineChartComposer

+ (AAChartModel *)withMinusNumberAreasplineChart {
    return [CustomStyleForAreaChartComposer withMinusNumberAreaChart].chartTypeSet(AAChartTypeAreaspline);
}

+ (AAChartModel *)colorfulGradientAreasplineChart {
    return [CustomStyleForAreaChartComposer colorfulGradientAreaChart].chartTypeSet(AAChartTypeAreaspline);
}

+ (AAChartModel *)gradientColorAreasplineChart {
    return [CustomStyleForAreaChartComposer gradientColorAreaChart].chartTypeSet(AAChartTypeAreaspline);
}

+ (AAChartModel *)thresholdForAreasplineChart {
    return [CustomStyleForAreaChartComposer thresholdForAreaChart].chartTypeSet(AAChartTypeAreaspline);
}

+ (AAChartModel *)customSpecialStyleDataLabelOfSingleDataElementForAreasplineChart {
    return [CustomStyleForAreaChartComposer customSpecialStyleDataLabelOfSingleDataElementForAreaChart].chartTypeSet(AAChartTypeAreaspline);
}

+ (AAChartModel *)customMarkerStatesHoverStyleForAreasplineChart {
    return [CustomStyleForAreaChartComposer customMarkerStatesHoverStyleForAreaChart].chartTypeSet(AAChartTypeAreaspline);
}

+ (AAChartModel *)colorfulGradientColorAndColorfulDataLabelsStepAreasplineChart {
    return [CustomStyleForAreaChartComposer colorfulGradientColorAndColorfulDataLabelsStepAreaChart].chartTypeSet(AAChartTypeAreaspline);
}

+ (AAChartModel *)negativeColorMixedAreasplineChart {
    return [CustomStyleForAreaChartComposer negativeColorMixedAreaChart].chartTypeSet(AAChartTypeAreaspline);
}

+ (AAChartModel *)customColorfulGradientColorZonesForAreasplineChart {
    return [CustomStyleForAreaChartComposer customColorfulGradientColorZonesForAreaChart].chartTypeSet(AAChartTypeAreaspline);
}

@end
