//
//  XAxisYAxisLabelsOptionsVC.m
//  AAChartKitDemo
//
//  Created by Admin on 2021/9/16.
//  Copyright © 2021 An An. All rights reserved.
//

#import "XAxisYAxisLabelsOptionsVC.h"

@interface XAxisYAxisLabelsOptionsVC ()

@end

@implementation XAxisYAxisLabelsOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (self.selectedIndex) {
        case 0: return [self configureXAxisLabelsFontColorWithHTMLString];//通过HTML字符串自定义X轴文字颜色
        case 1: return [self configureXAxisLabelsFontColorAndFontSizeWithHTMLString];//通过HTML字符串自定义X轴文字颜色和字体大小
        case 2: return [self customXAxisLabelsBeImages];//自定义曲线面积图 X 轴 labels 为一组图片🖼
        case 3: return [self configureYAxisLabelsNumericSymbolsMagnitudeOfAerasplineChart];//自定义 Y 轴的 Labels 国际单位符基数及国际单位符

        default:
            break;
    }
    return nil;
}

- (AAOptions *)configureXAxisLabelsFontColorWithHTMLString {
    NSArray *categories = @[
        @"<font color=\\\"#CC0066\\\">孤岛危机</font>",
        @"<font color=\\\"#CC0033\\\">使命召唤</font>",
        @"<font color=\\\"#FF0066\\\">荣誉勋章</font>",
        @"<font color=\\\"##66FF99\\\">狙击精英</font>",
        @"<font color=\\\"#00FF00\\\">神秘海域</font>",
        @"<font color=\\\"#00CC00\\\">美国末日</font>",
        @"<font color=\\\"#666FF\\\">巫师狂猎</font>",
        @"<font color=\\\"#000CC\\\">死亡搁浅</font>",
        @"<font color=\\\"#9933CC\\\">地狱边境</font>",
        @"<font color=\\\"##FFCC99\\\">忍者之印</font>",
        @"<font color=\\\"#FFCC00\\\">合金装备</font>",
        @"<font color=\\\"#CC99090\\\">全战三国</font>",
    ];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .stackingSet(AAChartStackingTypeNormal)
    .categoriesSet(categories)
    .markerRadiusSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorSet((id)[AAGradientColor mysticMauveColor])
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.yAxis.labels.format = @"{value} %";//给y轴添加单位
    aaOptions.xAxis.labels.useHTML = true;
    return aaOptions;
}

// Refer to the issue https://github.com/AAChartModel/AAChartKit/issues/630
- (AAOptions *)configureXAxisLabelsFontColorAndFontSizeWithHTMLString {
    NSArray *categories = @[
        @"<span style=\\\"color:#CC0066;font-weight:bold;font-size:10px\\\">使命召唤</span>",
        @"<span style=\\\"color:#CC0033;font-weight:bold;font-size:11px\\\">荣誉勋章</span>",
        @"<span style=\\\"color:#FF0066;font-weight:bold;font-size:12px\\\">狙击精英</span>",
        @"<span style=\\\"color:#66FF99;font-weight:bold;font-size:13px\\\">神秘海域</span>",
        @"<span style=\\\"color:#00FF00;font-weight:bold;font-size:14px\\\">美国末日</span>",
        @"<span style=\\\"color:#00CC00;font-weight:bold;font-size:15px\\\">巫师狂猎</span>",
        @"<span style=\\\"color:#000CCC;font-weight:bold;font-size:14px\\\">孤岛危机</span>",
        @"<span style=\\\"color:#666FFF;font-weight:bold;font-size:15px\\\">地狱边境</span>",
        @"<span style=\\\"color:#9933CC;font-weight:bold;font-size:13px\\\">忍者之印</span>",
        @"<span style=\\\"color:#FFCC99;font-weight:bold;font-size:12px\\\">合金装备</span>",
        @"<span style=\\\"color:#FFCC00;font-weight:bold;font-size:11px\\\">全战三国</span>",
        @"<span style=\\\"color:#CC9909;font-weight:bold;font-size:10px\\\">死亡搁浅</span>",
    ];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .stackingSet(AAChartStackingTypeNormal)
    .yAxisVisibleSet(false)
    .categoriesSet(categories)
    .markerRadiusSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorSet((id)[AAGradientColor deepSeaColor])
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.yAxis.labels.format = @"{value} %";//给y轴添加单位
    aaOptions.xAxis.labels.useHTML = true;
    return aaOptions;
}

- (AAOptions *)customXAxisLabelsBeImages {
    NSArray *imageLinkStrArr = @[
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197582.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197604.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197507.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197571.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197408.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197375.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197374.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>",
        @"<span><img src=\\\"https:/image.flaticon.com/icons/svg/197/197484.svg\\\" style=\\\"width: 30px; height: 30px;\\\"/><br></span>"
    ];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .stackingSet(AAChartStackingTypeNormal)
    .yAxisVisibleSet(false)
    .categoriesSet(imageLinkStrArr)
    .markerRadiusSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .colorSet((id)[AAGradientColor deepSeaColor])
        .dataSet(@[@7.0, @6.9, @2.5, @14.5, @13.2, @18.2, @29.5, @21.5, ]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.xAxis.labels.useHTML = true;
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/1208
- (AAOptions *)configureYAxisLabelsNumericSymbolsMagnitudeOfAerasplineChart {
    NSDictionary *gradientColorDic1 =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToBottom
                               startColorString:@"#FC354C"
                                 endColorString:@"#0ABFBC"];
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .titleSet(@"Numeric symbols magnitude")
    .subtitleSet(@"Chinese and Japanese uses ten thousands (万) as numeric symbol")
    .categoriesSet(@[
        @"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun",
        @"July", @"Aug", @"Spe", @"Oct", @"Nov", @"Dec"
    ])
    .markerRadiusSet(@8.0)//marker点半径为8个像素
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)//marker点为空心效果
    .markerSymbolSet(AAChartSymbolTypeCircle)//marker点为圆形点○
    .yAxisLineWidthSet(@0)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .legendEnabledSet(false)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .lineWidthSet(@7.0)
        .colorSet(AAColor.redColor)//猩红色, alpha 透明度 1
        .fillColorSet((id)gradientColorDic1)
        .dataSet(@[@70000.0, @60000.9, @20000.5, @140000.5, @180000.2, @210000.5, @50000.2, @260000.5, @230000.3, @450000.3, @130000.9, @90000.6]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.defaultOptions = AALang.new
    .numericSymbolMagnitudeSet(@10000) //国际单位符基数
    .numericSymbolsSet(@[@"万",@"億"]) //国际单位符
    ;
    
    return aaOptions;
}

@end
