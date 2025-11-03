#import "CustomStyleForSplineChartComposer.h"
#import "AAChartKit.h"
#import "CustomStyleForLineChartComposer.h"

@implementation CustomStyleForSplineChartComposer

+ (AAChartModel *)mixedSplineChart {
    return [CustomStyleForLineChartComposer mixedLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)stepSplineChart {
    return [CustomStyleForLineChartComposer stepLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)stepAreaChart {
    return [CustomStyleForLineChartComposer stepAreaChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)customSingleDataLabelForSplineChart {
    return [CustomStyleForLineChartComposer customSingleDataLabelForLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)shadowStyleSplineChart {
    return [CustomStyleForLineChartComposer shadowStyleLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)colorfulGradientSplineChart {
    return [CustomStyleForLineChartComposer colorfulGradientLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)customMarkerSymbolContentSplineChart {
    return [CustomStyleForLineChartComposer customMarkerSymbolContentLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)drawPointsWithCoordinatesForSplineChart {
    return [CustomStyleForLineChartComposer drawPointsWithCoordinatesForLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)customHoverAndSelectHaloStyleForSplineChart {
    return [CustomStyleForLineChartComposer customHoverAndSelectHaloStyleForLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)disableSomeOfLinesMouseTrackingEffectForSplineChart {
    return [CustomStyleForLineChartComposer disableSomeOfLinesMouseTrackingEffectForLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)colorfulShadowSplineChart {
    return [CustomStyleForLineChartComposer colorfulShadowLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)colorfulDataLabelsStepSplineChart {
    return [CustomStyleForLineChartComposer colorfulDataLabelsStepLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)disableMarkerHoverEffectForSplineChart {
    return [CustomStyleForLineChartComposer disableMarkerHoverEffectForLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)maxAndMinDataLabelsForSplineChart {
    return [CustomStyleForLineChartComposer maxAndMinDataLabelsForLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)dashStyleTypesMixedSplineChart {
    return [CustomStyleForLineChartComposer dashStyleTypesMixedLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)allLineDashStyleTypesMixedSplineChart {
    return [CustomStyleForLineChartComposer allLineDashStyleTypesMixedLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)shadowSplineChart {
    return [CustomStyleForLineChartComposer shadowLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)colorfulMarkersAndLinesSplineChart {
    return [CustomStyleForLineChartComposer colorfulMarkersAndLinesLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)colorfulMarkersAndLinesSplineChart2 {
    return [CustomStyleForLineChartComposer colorfulMarkersAndLinesLineChart2].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)connectNullsForSingleAASeriesElementSplineChart {
    return [CustomStyleForLineChartComposer connectNullsForSingleAASeriesElementLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)largeDifferencesInTheNumberOfDataInDifferentSeriesElementSplineChart {
    return [CustomStyleForLineChartComposer largeDifferencesInTheNumberOfDataInDifferentSeriesElementLineChart].chartTypeSet(AAChartTypeSpline);
}

+ (AAChartModel *)customDifferentDataLabelsShapeForSplineChart {
    return [CustomStyleForLineChartComposer customDifferentDataLabelsShapeForLineChart].chartTypeSet(AAChartTypeSpline);
}

@end
