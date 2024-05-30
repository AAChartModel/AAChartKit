//
//  SpecialStyleChartOptionsVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2022/10/9.
//  Copyright © 2022 An An. All rights reserved.
//

#import "SpecialStyleChartOptionsVC.h"

@interface SpecialStyleChartOptionsVC ()

@end

@implementation SpecialStyleChartOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (self.selectedIndex) {
        case  0: return [self everySingleColumnHasGrayBackground];//每根棱柱都有白色背景的柱形图
        case  1: return [self everySingleColumnHasWhiteEmptyBorderLineBackground];//每根棱柱都有空心白色边缘线的柱形图
        case  2: return [self colorfulSpecialStyleColumnChart];//温度计🌡风格的彩色棱柱图

        default:
            return nil;
    }
}

- (AAOptions *)everySingleColumnHasGrayBackground {
    NSArray *stopsArr = @[@[@0.0, @"#00feff"],//颜色字符串设置支持十六进制类型和 rgba 类型
                          @[@0.5, @"#027eff"],
                          @[@1.0, @"#0286ff"]];
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                     stopsArray:stopsArr];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .backgroundColorSet(@"#111c4e")
    .xAxisLabelsStyleSet(AAStyleColorSizeWeight(AAColor.whiteColor, 9, AAChartFontWeightTypeBold))
    .categoriesSet(@[
        @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
        @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
    ])
    .yAxisMaxSet(@260.0)
    .legendEnabledSet(false)
    .yAxisLineWidthSet(@1)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .colorSet(@"rgba(255,255,255,0.3)")
        .enableMouseTrackingSet(@false)
        .dataSet(@[@250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0,@250.0, @250.0,]),
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorSet((id)gradientColorDic1)
        .borderRadiusTopLeftSet((id)@"50%")
        .borderRadiusTopRightSet((id)@"50%")
        .dataSet(@[@211, @183, @157, @133, @111, @211, @183, @157, @133,@91, @73, @57, @43, @31, ]),
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.xAxis
    .lineWidthSet(@1)
    .lineColorSet(@"rgba(255,255,255,0.3)")
    .tickWidthSet(@0)
    .labels.styleSet(AAStyleColor(AAColor.whiteColor));

    aaOptions.yAxis
    .gridLineWidthSet(@0)
    .lineColorSet(@"rgba(255,255,255,0.3)")
    .labels.styleSet(AAStyleColor(AAColor.whiteColor));

    aaOptions.plotOptions
    .seriesSet(AASeries.new
               .borderRadiusTopLeftSet((id)@"50%")
               .borderRadiusTopRightSet((id)@"50%")
               .statesSet(AAStates.new
                          .inactiveSet(AAInactive.new
                                       .enabledSet(false)))
               .animationSet((id)@false)
               )
    .columnSet(AAColumn.new
               .groupingSet(false)
               .borderWidthSet(@0))
    ;
    
    aaOptions.tooltip
    .sharedSet(false)
    .backgroundColorSet((id)gradientColorDic1)
    .styleSet(AAStyleColorSize(AAColor.whiteColor, 12))
    .formatterSet(@AAJSFunc(function () {
        return '<b>'
        + this.x
        + '</b><br/>'
        + this.series.name
        + ': '
        + this.y
    }));
    return aaOptions;
}

- (AAOptions *)everySingleColumnHasWhiteEmptyBorderLineBackground {
    NSArray *stopsArr = @[@[@0.0, @"#00feff"],//颜色字符串设置支持十六进制类型和 rgba 类型
                          @[@0.5, @"#027eff"],
                          @[@1.0, @"#0286ff"]];
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                                     stopsArray:stopsArr];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .backgroundColorSet(@"#111c4e")
    .xAxisLabelsStyleSet(AAStyleColorSizeWeight(AAColor.whiteColor, 9, AAChartFontWeightTypeBold))
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .yAxisMaxSet(@260.0)
    .legendEnabledSet(false)
    .yAxisLineWidthSet(@1)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .colorSet(@"rgba(0,0,0,0)")
        .borderColorSet(@"rgba(255,255,255,0.4)")
        .dataSet(@[@250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0,]),
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorSet((id)gradientColorDic1)
        .borderWidthSet(@0)
        .dataSet( @[ @148.5, @216.4, @194.1, @95.6, @54.4, @129.2, @144.0, @176.0,@29.9, @71.5, @106.4, @135.6,]),
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.xAxis
    .lineWidthSet(@1)
    .lineColorSet(@"rgba(255,255,255,0.3)")
    .tickWidthSet(@0)
    .labels.styleSet(AAStyleColor(AAColor.whiteColor));
    
    aaOptions.yAxis
    .gridLineWidthSet(@0)
    .lineColorSet(@"rgba(255,255,255,0.3)")
    .labels.styleSet(AAStyleColor(AAColor.whiteColor));
    
    aaOptions.plotOptions
    .seriesSet(AASeries.new
               .borderRadiusTopLeftSet((id)@"50%")
               .borderRadiusTopRightSet((id)@"50%")
               .animationSet((id)@false)
               .statesSet(AAStates.new
                          .inactiveSet(AAInactive.new
                                       .enabledSet(false))))
    .columnSet(AAColumn.new
               .groupingSet(false))
    ;
    
    aaOptions.tooltip
    .sharedSet(false)
    .backgroundColorSet(AAColor.darkGrayColor)
    .styleSet(AAStyleColorSize(@"#FFD700", 12))
    .formatterSet(@AAJSFunc(function () {
        return '<b>'
        + this.x
        + '</b><br/>'
        + this.series.name
        + ': '
        + this.y
    }));
    return aaOptions;
}

//自定义温度计🌡样式图表
- (AAOptions *)colorfulSpecialStyleColumnChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .backgroundColorSet(@"#111c4e")
    .colorsThemeSet(@[@"#eb2100", @"#eb3600", @"#d0570e", @"#d0a00e", @"#34da62", @"#00e9db", @"#00c0e9", @"#0096f3", @"#33CCFF", @"#33FFCC"])
    .xAxisLabelsStyleSet(AAStyleColorSizeWeight(AAColor.whiteColor, 9, AAChartFontWeightTypeBold))
    .categoriesSet(@[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                     @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"])
    .yAxisMaxSet(@260.0)
    .legendEnabledSet(false)
    .yAxisLineWidthSet(@1)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .colorSet(@"rgba(0,0,0,0)")
        .colorByPointSet(@false)
        .enableMouseTrackingSet(@false)
        .borderColorSet(@"rgba(255,255,255,0.4)")
        .dataSet(@[@250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0, @250.0,]),
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorByPointSet(@true)
        .borderWidthSet(@0)
        .dataSet( @[ @148.5, @216.4, @194.1, @95.6, @54.4, @129.2, @144.0, @176.0,@29.9, @71.5, @106.4, @135.6,]),
        AASeriesElement.new
        .typeSet(AAChartTypeScatter)
        .colorByPointSet(@true)
        .enableMouseTrackingSet(@false)
        .markerSet(AAMarker.new
                   .radiusSet(@21))
        .dataSet(@[@0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f, @0.f,]),
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.xAxis
    .lineWidthSet(@1)
    .lineColorSet(@"rgba(255,255,255,0.3)")
    .tickWidthSet(@0)
    .labels.styleSet(AAStyleColor(AAColor.whiteColor));

    aaOptions.yAxis
    .gridLineWidthSet(@0)
    .lineColorSet(@"rgba(255,255,255,0.3)")
    .labels.styleSet(AAStyleColor(AAColor.whiteColor));

    aaOptions.plotOptions
    .seriesSet(AASeries.new
               .borderRadiusTopLeftSet((id)@"50%")
               .borderRadiusTopRightSet((id)@"50%")
               .animationSet((id)@false)
               .statesSet(AAStates.new
                          .inactiveSet(AAInactive.new
                                       .enabledSet(false))))
    .columnSet(AAColumn.new
               .groupingSet(false))
    ;
    
    aaOptions.tooltip
    .sharedSet(false)//这里如果想要 enableMouseTracking 为 false 的 series 不显示 tooltip, shared 必须设置为 true,可能是个小 bug,后面再改吧
    .backgroundColorSet(AAColor.darkGrayColor)
    .styleSet(AAStyleColorSize(@"#FFD700", 12))
    .formatterSet(@AAJSFunc(function () {
        return '<b>'
        + this.x
        + '</b><br/>'
        + this.series.name
        + ': '
        + this.y
    }));
    return aaOptions;
}

@end
