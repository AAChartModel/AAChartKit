//
//  JSFunctionForAALegendVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2022/9/9.
//  Copyright © 2022 An An. All rights reserved.
//*************** ............ SOURCE CODE ............ ***************
//***.............................................................  ***
//*** iOS     :https://github.com/AAChartModel/AAChartKit           ***
//*** iOS     :https://github.com/AAChartModel/AAChartKit-Swift     ***
//*** Android :https://github.com/AAChartModel/AAChartCore          ***
//*** Android :https://github.com/AAChartModel/AAChartCore-Kotlin   ***
//***...............................................................***
//*************** ............ SOURCE CODE ............ ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * 🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "JSFunctionForAALegendComposer.h"
#import "AAChartKit.h"

@interface JSFunctionForAALegendComposer ()

@end

@implementation JSFunctionForAALegendComposer

+ (AAOptions *)disableLegendClickEventForNormalChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .stackingSet(AAChartStackingTypeNormal)
    .markerRadiusSet(@0)
    .zoomTypeSet(AAChartZoomTypeX)
    .colorsThemeSet(@[
        AAGradientColor.oceanBlueColor,
        AAGradientColor.sanguineColor,
        AAGradientColor.lusciousLimeColor,
        AAGradientColor.mysticMauveColor
                    ])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .dataSet(@[@45000, @43000, @50000, @55000, @58000, @62000, @83000, @39000, @56000, @67000, @50000, @34000, @50000, @67000, @58000, @29000, @46000, @23000, @47000, @46000, @38000, @56000, @48000, @36000]),
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .dataSet(@[@38000, @31000, @32000, @32000, @64000, @66000, @86000, @47000, @52000, @75000, @52000, @56000, @54000, @60000, @46000, @63000, @54000, @51000, @58000, @64000, @60000, @45000, @36000, @67000]),
        AASeriesElement.new
        .nameSet(@"London Hot")
        .dataSet(@[@46000, @32000, @53000, @58000, @86000, @68000, @85000, @73000, @69000, @71000, @91000, @74000, @60000, @50000, @39000, @67000, @55000, @49000, @65000, @45000, @64000, @47000, @63000, @64000]),
        AASeriesElement.new
        .nameSet(@"NewYork Hot")
        .dataSet(@[@60000, @51000, @52000, @53000, @64000, @84000, @65000, @68000, @63000, @47000, @72000, @60000, @65000, @74000, @66000, @65000, @71000, @59000, @65000, @77000, @52000, @53000, @58000, @53000]),
               ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;

    aaOptions.legend
    .enabledSet(true)
    .alignSet(AAChartAlignTypeRight)//设置图例位于水平方向上的右侧
    .layoutSet(AAChartLayoutTypeVertical)//设置图例排列方式为垂直排布
    .verticalAlignSet(AAChartVerticalAlignTypeTop)//设置图例位于竖直方向上的顶部
    ;

    //禁用图例点击事件
    aaOptions.plotOptions.series.events = AASeriesEvents.new
    .legendItemClickSet(@AAJSFunc(function() {
        return false;
    }));

    return aaOptions;
}


//https://github.com/AAChartModel/AAChartKit-Swift/issues/391
//https://github.com/AAChartModel/AAChartKit-Swift/issues/393
//https://github.com/AAChartModel/AAChartKit/issues/1180
+ (AAOptions *)disableLegendClickEventForPieChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypePie)
    .backgroundColorSet(AAColor.whiteColor)
    .titleSet(@"LANGUAGE MARKET SHARES JANUARY,2020 TO MAY")
    .subtitleSet(@"virtual data")
    .dataLabelsEnabledSet(true)//是否直接显示扇形图数据
    .yAxisTitleSet(@"℃")
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Language market shares")
        .innerSizeSet(@"20%")//内部圆环半径大小占比(内部圆环半径/扇形图半径),
        .allowPointSelectSet(true)
        .statesSet(AAStates.new
                   .hoverSet(AAHover.new
                             .enabledSet(false)//禁用点击区块之后出现的半透明遮罩层
                             )
                   )
        .dataSet(@[
            @[@"Java"  ,@67],
            @[@"Swift",@999],
            @[@"Python",@83],
            @[@"OC"    ,@11],
            @[@"Go"    ,@30],
        ])
    ]);

    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.legend.labelFormatSet(@"{name} {percentage:.2f}%");

    //禁用饼图图例点击事件
    aaOptions.plotOptions.series
    .statesSet(AAStates.new
               .inactiveSet(AAInactive.new
                            .enabledSet(false)))//禁用点击图表时, 部分视图高亮, 部分视图变淡的交互效果,参考 https://github.com/AAChartModel/AAChartKit/issues/949
    .pointSet(AAPoint.new
              .eventsSet(AAPointEvents.new
                         .legendItemClickSet(@AAJSFunc(function() {
                             return false;
                         }))
                         )
              );

    return aaOptions;
}


//https://bbs.hcharts.cn/article-109-1.html
//图表自带的图例点击事件是：
//点击某个显示/隐藏的图例，该图例对应的serie就隐藏/显示。
//个人觉得不合理，正常来说，有多条折线(或其他类型的图表)，点击某个图例是想只看该图例对应的数据；
//于是修改了图例点击事件。
//
//实现的效果是(以折线图为例)：
//1. 当某条折线隐藏时，点击该折线的图例 --> 该折线显示；
//2. 当全部折线都显示时，点击某个图例 --> 该图例对应的折线显示，其他折线均隐藏；
//3. 当只有一条折线显示时，点击该折线的图例 --> 全部折线均显示；
//4. 其他情况，按默认处理：
//显示 --> 隐藏；
//隐藏 --> 显示；
//Customized legengItemClick Event online: http://code.hcharts.cn/rencht/hhhhLv/share
+ (AAOptions *)customLegendItemClickEvent {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .stackingSet(AAChartStackingTypeNormal)
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主题颜色数组
    .markerRadiusSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"2017")
        .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
        AASeriesElement.new
        .nameSet(@"2018")
        .dataSet(@[@0.2, @0.8, @5.7, @11.3, @17.0, @22.0, @24.8, @24.1, @20.1, @14.1, @8.6, @2.5]),
        AASeriesElement.new
        .nameSet(@"2019")
        .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0]),
        AASeriesElement.new
        .nameSet(@"2020")
        .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8]),
               ]);
    ;
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.legend
    .enabledSet(true)
    .alignSet(AAChartAlignTypeRight)//设置图例位于水平方向上的右侧
    .layoutSet(AAChartLayoutTypeVertical)//设置图例排列方式为垂直排布
    .verticalAlignSet(AAChartVerticalAlignTypeTop)//设置图例位于竖直方向上的顶部
    ;
        
    //自定义图例点击事件
    aaOptions.plotOptions.series.events = AASeriesEvents.new
    .legendItemClickSet(@AAJSFunc(function(event) {
        function getVisibleMode(series, serieName) {
            var allVisible = true;
            var allHidden = true;
            for (var i = 0; i < series.length; i++) {
                if (series[i].name == serieName)
                    continue;
                allVisible &= series[i].visible;
                allHidden &= (!series[i].visible);
            }
            if (allVisible && !allHidden)
                return 'all-visible';
            if (allHidden && !allVisible)
                return 'all-hidden';
            return 'other-cases';
        }
        
        var series = this.chart.series;
        var mode = getVisibleMode(series, this.name);
        var enableDefault = false;
        if (!this.visible) {
            enableDefault = true;
        }
        else if (mode == 'all-visible') {
            var seriesLength = series.length;
            for (var i = 0; i < seriesLength; i++) {
                var serie = series[i];
                serie.hide();
            }
            this.show();
        }
        else if (mode == 'all-hidden') {
            var seriesLength = series.length;
            for (var i = 0; i < seriesLength; i++) {
                var serie = series[i];
                serie.show();
            }
        }
        else {
            enableDefault = true;
        }
        return enableDefault;
    }));

    return aaOptions;
}


@end
