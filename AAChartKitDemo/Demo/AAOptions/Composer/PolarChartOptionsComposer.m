//
//  PolarChartOptionsComposer.m
//  AAChartKitDemo
//
//  Created by Admin on 2021/9/15.
//  Copyright © 2021 An An. All rights reserved.
//

#import "PolarChartOptionsComposer.h"

@interface PolarChartOptionsComposer ()

@end

@implementation PolarChartOptionsComposer




+ (AAOptions *)configureThePolygonPolarChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图表类型
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@1])//y轴横向分割线宽度为0(即是隐藏分割线)
    .markerRadiusSet(@0)
    .polarSet(true)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .colorSet((id)AAGradientColor.deepSeaColor)
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;

    aaOptions.xAxis.visible = false;//避免多边形外环之外有额外套了一层无用的外环
    aaOptions.yAxis.gridLineInterpolation = AAChartYAxisGridLineInterpolationTypePolygon;
    return aaOptions;
}

+ (AAOptions *)adjustGroupPaddingForPolarChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .titleSet(@"Colorful Column Chart")
    .subtitleSet(@"single data array colorful column chart")
    .borderRadiusSet(@5)
    .polarSet(true)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[@211,@183,@157,@133,@111]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    AAColumn *aaColumn = aaOptions.plotOptions.column;
    aaColumn.groupPadding = @0.05;
    aaColumn.colorByPoint = true;
    return aaOptions;
}

//三角形雷达图
+ (AAOptions *)configureTriangleRadarChart {
    AALineStyle *gridLineStyle = [AALineStyle styleWithWidth:@1];
    
    AACrosshair *crosshairStyle =
    [AACrosshair crosshairWithColor:AAColor.whiteColor
                      dashStyle:AAChartLineDashStyleTypeLongDashDotDot
                          width:@1.5];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .backgroundColorSet(AAColor.whiteColor)
    .markerRadiusSet(@0)
    .yAxisMaxSet(@25)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@1])
    .polarSet(true)
    .legendEnabledSet(false)
    .tooltipEnabledSet(false)
    .xAxisGridLineStyleSet(gridLineStyle)
    .yAxisGridLineStyleSet(gridLineStyle)
    .xAxisCrosshairSet(crosshairStyle)
    .yAxisCrosshairSet(crosshairStyle)
    .yAxisTickPositionsSet(@[@5,@10,@15,@20,@25,])
    .seriesSet(@[
        AASeriesElement.new
        .colorSet(AAColor.whiteColor)
        .fillOpacitySet(@0.01)
        .dataLabelsSet(AADataLabels.new
                       .colorSet(AARgbaColor(30, 144, 255, 1.0)))
        .dataSet(@[@17.0, @16.9, @12.5,]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.yAxis.gridLineInterpolation = AAChartYAxisGridLineInterpolationTypePolygon;
    
    aaOptions.xAxis.lineWidth = @0;//避免多边形外环之外有额外套了一层无用的外环
    aaOptions.xAxis.gridLineColor = AARgbaColor(30, 144, 255, 0.6);
    aaOptions.yAxis.gridLineColor = AARgbaColor(30, 144, 255, 1.0);
    
    NSArray *aaPlotBandsArr = @[
        AAPlotBandsElement.new
        .fromSet(@0)
        .toSet(@5)
        .colorSet(AARgbaColor(30, 144, 255, 1.0)),
        AAPlotBandsElement.new
        .fromSet(@5)
        .toSet(@10)
        .colorSet(AARgbaColor(30, 144, 255, 0.8)),
        AAPlotBandsElement.new
        .fromSet(@10)
        .toSet(@15)
        .colorSet(AARgbaColor(30, 144, 255, 0.6)),
        AAPlotBandsElement.new
        .fromSet(@15)
        .toSet(@20)
        .colorSet(AARgbaColor(30, 144, 255, 0.4)),
        AAPlotBandsElement.new
        .fromSet(@20)
        .toSet(@25)
        .colorSet(AARgbaColor(30, 144, 255, 0.2)),
    ];
    
    AAYAxis *aaYAxis = aaOptions.yAxis;
    aaYAxis.plotBands = aaPlotBandsArr;
    return aaOptions;
}

//四边形雷达图
+ (AAOptions *)configureQuadrangleRadarChart {
    AAOptions *aaOptions = [self configureTriangleRadarChart];
    aaOptions.yAxis.plotBands = @[
        AAPlotBandsElement.new
        .fromSet(@0)
        .toSet(@5)
        .colorSet(AARgbaColor(255, 0, 0, 1.0)),
        AAPlotBandsElement.new
        .fromSet(@5)
        .toSet(@10)
        .colorSet(AARgbaColor(255, 0, 0, 0.8)),
        AAPlotBandsElement.new
        .fromSet(@10)
        .toSet(@15)
        .colorSet(AARgbaColor(255, 0, 0, 0.6)),
        AAPlotBandsElement.new
        .fromSet(@15)
        .toSet(@20)
        .colorSet(AARgbaColor(255, 0, 0, 0.4)),
        AAPlotBandsElement.new
        .fromSet(@20)
        .toSet(@25)
        .colorSet(AARgbaColor(255, 0, 0, 0.2)),
        
    ];
    
    aaOptions.xAxis.gridLineColor = AARgbaColor(255, 0, 0, 0.6);
    aaOptions.yAxis.gridLineColor = AARgbaColor(255, 0, 0, 1.0);
    
    AASeriesElement *element = aaOptions.series[0];
    element
    .dataSet(@[@17.0, @16.9, @12.5, @14.5,])
    .dataLabelsSet(AADataLabels.new
                   .colorSet(AARgbaColor(255, 0, 0, 1.0)))
    ;
    
    return aaOptions;
}

//五边形雷达图
+ (AAOptions *)configurePentagonRadarChart {
    AAOptions *aaOptions = [self configureTriangleRadarChart];
    aaOptions.yAxis.plotBands = @[
        AAPlotBandsElement.new
        .fromSet(@0)
        .toSet(@5)
        .colorSet(AARgbaColor(255, 215, 0, 1.0)),
        AAPlotBandsElement.new
        .fromSet(@5)
        .toSet(@10)
        .colorSet(AARgbaColor(255, 215, 0, 0.8)),
        AAPlotBandsElement.new
        .fromSet(@10)
        .toSet(@15)
        .colorSet(AARgbaColor(255, 215, 0, 0.6)),
        AAPlotBandsElement.new
        .fromSet(@15)
        .toSet(@20)
        .colorSet(AARgbaColor(255, 215, 0, 0.4)),
        AAPlotBandsElement.new
        .fromSet(@20)
        .toSet(@25)
        .colorSet(AARgbaColor(255, 215, 0, 0.2)),
        
    ];
    
    aaOptions.xAxis.gridLineColor = AARgbaColor(255, 215, 0, 0.6);
    aaOptions.yAxis.gridLineColor = AARgbaColor(255, 215, 0, 1.0);
    
    AASeriesElement *element = aaOptions.series[0];
    element
    .dataSet(@[@17.0, @16.9, @12.5, @14.5, @18.2,])
    .dataLabelsSet(AADataLabels.new
                   .colorSet(AARgbaColor(255, 215, 0, 1.0)))
    ;
    
    return aaOptions;
}

//六边形雷达图
+ (AAOptions *)configureHexagonRadarChart {
    AAOptions *aaOptions = [self configureTriangleRadarChart];
    aaOptions.yAxis.plotBands = @[
        AAPlotBandsElement.new
        .fromSet(@0)
        .toSet(@5)
        .colorSet(AARgbaColor(50, 205, 50, 1.0)),
        AAPlotBandsElement.new
        .fromSet(@5)
        .toSet(@10)
        .colorSet(AARgbaColor(50, 205, 50, 0.8)),
        AAPlotBandsElement.new
        .fromSet(@10)
        .toSet(@15)
        .colorSet(AARgbaColor(50, 205, 50, 0.6)),
        AAPlotBandsElement.new
        .fromSet(@15)
        .toSet(@20)
        .colorSet(AARgbaColor(50, 205, 50, 0.4)),
        AAPlotBandsElement.new
        .fromSet(@20)
        .toSet(@25)
        .colorSet(AARgbaColor(50, 205, 50, 0.2)),
        
    ];
    
    aaOptions.xAxis.gridLineColor = AARgbaColor(50, 205, 50, 0.6);
    aaOptions.yAxis.gridLineColor = AARgbaColor(50, 205, 50, 1.0);
    
    AASeriesElement *element = aaOptions.series[0];
    element
    .dataSet(@[@17.0, @16.9, @12.5, @14.5, @18.2, @21.5,])
    .dataLabelsSet(AADataLabels.new
                   .colorSet(AARgbaColor(50, 205, 50, 1.0)))
    ;
    
    return aaOptions;
}

//🕸蜘蛛网状雷达图
+ (AAOptions *)configureSpiderWebRadarChart {
    AAOptions *aaOptions = [self configureTriangleRadarChart];
    aaOptions.yAxis.plotBands = @[
        AAPlotBandsElement.new
        .fromSet(@0)
        .toSet(@5)
        .colorSet(AARgbaColor(138, 43, 226, 1.0)),
        AAPlotBandsElement.new
        .fromSet(@5)
        .toSet(@10)
        .colorSet(AARgbaColor(138, 43, 226, 0.8)),
        AAPlotBandsElement.new
        .fromSet(@10)
        .toSet(@15)
        .colorSet(AARgbaColor(138, 43, 226, 0.6)),
        AAPlotBandsElement.new
        .fromSet(@15)
        .toSet(@20)
        .colorSet(AARgbaColor(138, 43, 226, 0.4)),
        AAPlotBandsElement.new
        .fromSet(@20)
        .toSet(@25)
        .colorSet(AARgbaColor(138, 43, 226, 0.2)),
    ];
    
    aaOptions.xAxis.gridLineColor = AARgbaColor(138, 43, 226, 0.6);
    aaOptions.yAxis.gridLineColor = AARgbaColor(138, 43, 226, 1.0);
    
    AASeriesElement *element = aaOptions.series[0];
    element
    .dataSet(@[@2, @4, @6, @8, @10, @12, @14, @16, @18, @20, @22, @24])
    .dataLabelsSet(AADataLabels.new
                   .colorSet(AARgbaColor(138, 43, 226, 1.0)))
    ;
    
    return aaOptions;
}

/**
 Highcharts.chart('container', {
     chart: {
         polar: true,
         type: 'line' // 或 'column'
     },
     title: {
         text: '五边形雷达图示例'
     },
     xAxis: {
         categories: ['指标1', '指标2', '指标3', '指标4', '指标5'],
         tickmarkPlacement: 'on',
         lineWidth: 0
     },
     yAxis: {
         gridLineInterpolation: 'polygon',
         lineWidth: 0,
         min: 0
     },
     series: [{
         name: '数据系列1',
         data: [5, 3, 4, 7, 2],
         pointPlacement: 'on'
     }]
 });
 */

+ (AAOptions *)radarChartWithCategories {
    return AAOptions.new
    .chartSet(AAChart.new
              .polarSet(true)
              .typeSet(AAChartTypeLine))
    .titleSet(AATitle.new
              .textSet(@"五边形雷达图示例"))
    .xAxisSet(AAXAxis.new
              .categoriesSet(@[@"指标1", @"指标2", @"指标3", @"指标4", @"指标5"])
              .tickmarkPlacementSet(@"on")
              .lineWidthSet(@0))
    .yAxisSet(AAYAxis.new
              .gridLineInterpolationSet(@"polygon")
              .lineWidthSet(@0)
              .minSet(@0))
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"数据系列1")
        .dataSet(@[@5, @3, @4, @7, @2])
        .pointPlacementSet(@"on")
    ]);
}

@end
