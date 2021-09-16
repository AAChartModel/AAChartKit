//
//  DataLabelsOptionsVC.m
//  AAChartKitDemo
//
//  Created by Admin on 2021/9/16.
//  Copyright © 2021 An An. All rights reserved.
//

#import "DataLabelsOptionsVC.h"

@interface DataLabelsOptionsVC ()

@end

@implementation DataLabelsOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (self.selectedIndex) {
        case 0: return [self adjustChartDataLabelsStyle];//自定义DataLabels样式
        case 1: return [self customizeEveryDataLabelBySinglely];//单独自定义指定的data的DataLabels样式
        case 2: return [self configureStackingColumnChartDataLabelsOverflow];//允许DataLabels文字溢出绘图区
        case 3: return [self configureReversedBarChartDataLabelsStyle];//调整Y轴倒转的条形图的DataLabels风格样式
        case 4: return [self configureColumnChartDataLabelsLayout];//配置柱状图📊的 dataLabels 布局

        default:
            break;
    }
    return nil;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/521
- (AAOptions *)adjustChartDataLabelsStyle {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeSpline)//图表类型
    .markerRadiusSet(@7)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeBorderBlank)
    .dataLabelsEnabledSet(true)
    .yAxisLineWidthSet(@0)
    .legendEnabledSet(false)
    .xAxisGridLineStyleSet([AALineStyle styleWithColor:AAColor.grayColor dashStyle:AAChartLineDashStyleTypeLongDashDot width:@1])
    .tooltipEnabledSet(false)
    .categoriesSet(@[
        @"10-01",@"10-02",@"10-03",@"10-04",@"10-05",@"10-06",@"10-07",@"10-08",@"10-09",
        @"10-10",@"10-11",@"10-12",@"10-13",@"10-14",@"10-15",])
    .seriesSet(@[
        AASeriesElement.new
        .colorSet(AAColor.redColor)// blue color
        .nameSet(@"2020")
        .dataSet(@[
            @1.51, @6.7, @0.94, @1.44, @3.87, @3.24, @4.90, @4.61, @4.10,
            @4.17, @3.85, @4.17, @3.46, @3.46, @3.55,]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.yAxis.gridLineDashStyle = AAChartLineDashStyleTypeLongDash;//设置Y轴的网格线样式为 AAChartLineDashStyleTypeLongDash
    aaOptions.plotOptions.series.dataLabels
    .ySet(@-10)
    .formatSet(@"{y}美元")
    .colorSet(AAColor.redColor)
    .backgroundColorSet(AAColor.whiteColor)
    .borderColorSet(AAColor.redColor)
    .shapeSet(@"callout")
    .borderRadiusSet(@1)
    .borderWidthSet(@1);
    
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/589
- (AAOptions *)customizeEveryDataLabelBySinglely {
    NSArray *dataArr = @[
        AADataElement.new
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .formatSet(@"{y} 美元")
                       )
        .ySet(@7.1),
        AADataElement.new
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .formatSet(@"{y} 欧元")
                       )
        .ySet(@6.9),
        AADataElement.new
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .formatSet(@"{y} 人民币")
                       )
        .ySet(@2.5),
        AADataElement.new
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .formatSet(@"{y} 日元")
                       )
        .ySet(@14.5),
        AADataElement.new
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .formatSet(@"{y} 韩元")
                       )
        .ySet(@18.2),
        AADataElement.new
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .formatSet(@"{y} 越南盾")
                       )
        .ySet(@18.2),
        AADataElement.new
        .dataLabelsSet(AADataLabels.new
                       .enabledSet(true)
                       .formatSet(@"{y} 港币")
                       )
        .ySet(@21.5),
    ];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)//图表类型
    .dataLabelsEnabledSet(true)
    .tooltipEnabledSet(false)
    .colorsThemeSet(@[AAColor.lightGrayColor])
    .markerRadiusSet(@0)
    .legendEnabledSet(false)
    .categoriesSet(@[@"美国🇺🇸",@"欧洲🇪🇺",@"中国🇨🇳",@"日本🇯🇵",@"韩国🇰🇷",@"越南🇻🇳",@"中国香港🇭🇰",])
    .seriesSet(@[
        AASeriesElement.new
        .colorSet((id)AAGradientColor.fizzyPeachColor)
        .dataSet(dataArr),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.yAxis.gridLineDashStyle = AAChartLineDashStyleTypeLongDash;//设置Y轴的网格线样式为 AAChartLineDashStyleTypeLongDash
    
    aaOptions.plotOptions.series.dataLabels
    .xSet(@3)
    .ySet(@-20)
    .verticalAlignSet(AAChartVerticalAlignTypeMiddle)
    .backgroundColorSet(AAColor.whiteColor)// white color
    .borderColorSet(AAColor.redColor)// red color
    .shapeSet(@"callout")
    .borderRadiusSet(@1.5)
    .borderWidthSet(@1.3)
    .styleSet(AAStyleColorSizeWeight(AAColor.redColor, 15, AAChartFontWeightTypeBold))
    ;
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/707
- (AAOptions *)configureStackingColumnChartDataLabelsOverflow {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .subtitleSet(@"检测数量")
    .dataLabelsEnabledSet(true)
    .categoriesSet(@[@"呋喃西林代谢物",@"孔雀石绿🦚",@"氯霉素",@"呋喃唑酮代谢物"])
    .stackingSet(AAChartStackingTypeNormal)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"不合格")
        .colorSet(@"#F55E4E")
        .dataSet(@[@3,@1,@1,@0])
        ,
        AASeriesElement.new
        .nameSet(@"合格")
        .colorSet(@"#5274BC")
        .dataSet(@[@4,@0,@1,@1])
        ,
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    AADataLabels *aaDataLabels = aaOptions.plotOptions.series.dataLabels;
    
    //通过设置 crop 为 false 及 overflow 为"none" 可以让数据标签显示在绘图区的外面
    //参见:https://api.highcharts.com.cn/highcharts#plotOptions.column.dataLabels.overflow
    aaDataLabels
    .enabledSet(YES)
    .allowOverlapSet(YES)
    .cropSet(false)
    .overflowSet(@"none")
    .styleSet(AAStyle.new
              .colorSet(AAColor.blackColor)
              .fontSizeSet(@"11px")
              )
    ;
    
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/735
- (AAOptions *)configureReversedBarChartDataLabelsStyle {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeBar)
    .stackingSet(AAChartStackingTypeNormal)
    .markerRadiusSet(@0)
    .yAxisReversedSet(true)
    .colorsThemeSet(@[AAGradientColor.sanguineColor])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .dataSet(@[@140,@120,@100,@80,@60,@40,@20])
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.plotOptions.series
    .dataLabelsSet(AADataLabels.new
                   .enabledSet(true)
                   .alignSet(AAChartAlignTypeRight)//DataLabels水平对齐位置
                   .insideSet(true)//DataLabels是否在条形图的长条内部
                   .styleSet(AAStyle.new
                             .colorSet(AAColor.whiteColor)
                             .fontWeightSet(AAChartFontWeightTypeBold)
                             .fontSizeSet(@"28px")
                             .textOutlineSet(@"0px 0px contrast")//文字轮廓描边
                             ));
    
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/1247
- (AAOptions *)configureColumnChartDataLabelsLayout {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .borderRadiusSet(@10)
    .colorsThemeSet(@[AAColor.redColor])//设置主题颜色数组
    .categoriesSet(@[
        @"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
        @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"
                   ])
    .dataLabelsEnabledSet(true)
    .yAxisVisibleSet(false)
    .yAxisLineWidthSet(@0)//Y轴轴线线宽为0即是隐藏Y轴轴线
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])//y轴横向分割线宽度为0(即是隐藏分割线)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[
            @7.0, @6.9, @9.5, @14.5, @18.2, @21.5,
            @25.2, @26.5, @23.3, @18.3, @13.9, @9.6
                 ]),
               ])
    ;
    
    AAOptions *aaOptions = [aaChartModel aa_toAAOptions];
    
    aaOptions.tooltip.enabled = false;
    
    aaOptions.plotOptions.series.dataLabels
    .insideSet(true)//DataLabels是否在内部
    .verticalAlignSet(AAChartVerticalAlignTypeTop)
    .styleSet(AAStyleColorSizeWeightOutline(AAColor.whiteColor, 14, AAChartFontWeightTypeBold,@"none"))
    ;
    
    return aaOptions;
}

@end
