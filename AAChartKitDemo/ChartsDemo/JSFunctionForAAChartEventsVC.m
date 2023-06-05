//
//  JSFunctionForAAChartEventsVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2022/8/26.
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

#import "JSFunctionForAAChartEventsVC.h"
#import "AAChartKit.h"
#import "AADateUTCTool.h"

@interface JSFunctionForAAChartEventsVC ()

@end

@implementation JSFunctionForAAChartEventsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSUInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [self setCrosshairAndTooltipToTheDefaultPositionAfterLoadingChart]; //图表加载完成后,自动设置默认的十字准星和浮动提示框的位置
        case 1: return [self generalDrawingChart]; //自由绘图
        case 2: return [self advancedTimeLineChart]; //高级时间线图
        case 3: return [self configureBlinkMarkerChart]; //配置闪烁的标记点
        case 4: return [self configureSpecialStyleMarkerOfSingleDataElementChartWithBlinkEffect]; //配置单个数据元素的特殊样式标记点即闪烁特效
        case 5: return [self configureScatterChartWithBlinkEffect]; //配置散点图的闪烁特效
        case 6: return [self automaticallyHideTooltipAfterItIsShown]; //图表加载完成后,自动隐藏浮动提示框
        case 7: return [self dynamicHeightGridLineAreaChart]; //动态高度网格线的区域填充图
        case 8: return [self customizeYAxisPlotLinesLabelBeSpecialStyle]; //自定义 Y 轴轴线上面的标签文字特殊样式
        case 9: return [self configureECGStyleChart]; //配置心电图样式的图表
        case 10: return [self configureTheSizeOfTheSliceOfDonutAndPieChart]; //配置环形图和饼图的扇区大小
        case 11: return [self configurePlotBackgroundClickEvent]; //配置绘图区的点击事件

    }
    return nil;
}

//https://github.com/AAChartModel/AAChartKit-Swift/issues/345
- (AAOptions *)setCrosshairAndTooltipToTheDefaultPositionAfterLoadingChart {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)//图表类型
    .colorsThemeSet(@[@"#04d69f",@"#1e90ff",@"#ef476f",@"#ffd066",])
    .stackingSet(AAChartStackingTypeNormal)
    .yAxisVisibleSet(false)
    .markerRadiusSet(@0)
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Tokyo Hot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.45, @0.43, @0.50, @0.55, @0.58, @0.62, @0.83, @0.39, @0.56, @0.67, @0.50, @0.34, @0.50, @0.67, @0.58, @0.29, @0.46, @0.23, @0.47, @0.46, @0.38, @0.56, @0.48, @0.36]),
        AASeriesElement.new
        .nameSet(@"Berlin Hot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.38, @0.31, @0.32, @0.32, @0.64, @0.66, @0.86, @0.47, @0.52, @0.75, @0.52, @0.56, @0.54, @0.60, @0.46, @0.63, @0.54, @0.51, @0.58, @0.64, @0.60, @0.45, @0.36, @0.67]),
        AASeriesElement.new
        .nameSet(@"London Hot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.46, @0.32, @0.53, @0.58, @0.86, @0.68, @0.85, @0.73, @0.69, @0.71, @0.91, @0.74, @0.60, @0.50, @0.39, @0.67, @0.55, @0.49, @0.65, @0.45, @0.64, @0.47, @0.63, @0.64]),
        AASeriesElement.new
        .nameSet(@"NewYork Hot")
        .lineWidthSet(@5.0)
        .fillOpacitySet(@0.4)
        .dataSet(@[@0.60, @0.51, @0.52, @0.53, @0.64, @0.84, @0.65, @0.68, @0.63, @0.47, @0.72, @0.60, @0.65, @0.74, @0.66, @0.65, @0.71, @0.59, @0.65, @0.77, @0.52, @0.53, @0.58, @0.53]),
    ]);
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.tooltip
        .styleSet(AAStyleColor(AAColor.whiteColor))
        .backgroundColorSet(@"#050505")
        .borderColorSet(@"#050505");
    
    aaOptions.xAxis
        .crosshairSet(AACrosshair.new
            .colorSet(AAColor.darkGrayColor)
            .dashStyleSet(AAChartLineDashStyleTypeLongDashDotDot)
            .widthSet(@2));
    
    //默认选中的位置索引
    NSUInteger defaultSelectedIndex = 5;
    
    //https://api.highcharts.com/highcharts/chart.events.load
    //https://www.highcharts.com/forum/viewtopic.php?t=36508
    aaOptions.chart
        .eventsSet(AAChartEvents.new
            .loadSet([NSString stringWithFormat:@AAJSFunc(function() {
                const points = [];
                const chart = this;
                const series = chart.series;
                const length = series.length;
                           
                for (let i = 0; i < length; i++) {
                    const pointElement = series[i].data[%ld];
                    pointElement.onMouseOver();
                    points.push(pointElement);
                }
                chart.xAxis[0].drawCrosshair(null, points[0]);
                chart.tooltip.refresh(points);
                       }), defaultSelectedIndex]));
    
    
    return aaOptions;
}

- (AAOptions *)generalDrawingChart {
    return AAOptions.new
    .chartSet(AAChart.new
              .backgroundColorSet(AAColor.whiteColor)
              .eventsSet(AAChartEvents.new
                         .loadSet(@AAJSFunc((function() {
                             // Draw the flow chart
                             var ren = this.renderer,
                                 colors = Highcharts.getOptions().colors,
                                 rightArrow = ['M', 0, 0, 'L', 100, 0, 'L', 95, 5, 'M', 100, 0, 'L', 95, -5],
                                 leftArrow = ['M', 100, 0, 'L', 0, 0, 'L', 5, 5, 'M', 0, 0, 'L', 5, -5];


                             // Separator, client from service
                             ren.path(['M', 120, 40, 'L', 120, 330])
                                 .attr({
                                     'stroke-width': 2,
                                     stroke: 'silver',
                                     dashstyle: 'dash'
                                 })
                                 .add();

                             // Separator, CLI from service
                             ren.path(['M', 420, 40, 'L', 420, 330])
                                 .attr({
                                     'stroke-width': 2,
                                     stroke: 'silver',
                                     dashstyle: 'dash'
                                 })
                                 .add();

                             // Headers
                             ren.label('Web client', 20, 40)
                                 .css({
                                     fontWeight: 'bold'
                                 })
                                 .add();
                             ren.label('Web service / CLI', 220, 40)
                                 .css({
                                     fontWeight: 'bold'
                                 })
                                 .add();
                             ren.label('Command line client', 440, 40)
                                 .css({
                                     fontWeight: 'bold'
                                 })
                                 .add();

                             // SaaS client label
                             ren.label('SaaS client<br/>(browser or<br/>script)', 10, 82)
                                 .attr({
                                     fill: colors[0],
                                     stroke: 'white',
                                     'stroke-width': 2,
                                     padding: 5,
                                     r: 5
                                 })
                                 .css({
                                     color: 'white'
                                 })
                                 .add()
                                 .shadow(true);

                             // Arrow from SaaS client to Phantom JS
                             ren.path(rightArrow)
                                 .attr({
                                     'stroke-width': 2,
                                     stroke: colors[3]
                                 })
                                 .translate(95, 95)
                                 .add();

                             ren.label('POST options in JSON', 90, 75)
                                 .css({
                                     fontSize: '10px',
                                     color: colors[3]
                                 })
                                 .add();

                             ren.label('PhantomJS', 210, 82)
                                 .attr({
                                     r: 5,
                                     width: 100,
                                     fill: colors[1]
                                 })
                                 .css({
                                     color: 'white',
                                     fontWeight: 'bold'
                                 })
                                 .add();

                             // Arrow from Phantom JS to Batik
                             ren.path(['M', 250, 110, 'L', 250, 185, 'L', 245, 180, 'M', 250, 185, 'L', 255, 180])
                                 .attr({
                                     'stroke-width': 2,
                                     stroke: colors[3]
                                 })
                                 .add();

                             ren.label('SVG', 255, 120)
                                 .css({
                                     color: colors[3],
                                     fontSize: '10px'
                                 })
                                 .add();

                             ren.label('Batik', 210, 200)
                                 .attr({
                                     r: 5,
                                     width: 100,
                                     fill: colors[1]
                                 })
                                 .css({
                                     color: 'white',
                                     fontWeight: 'bold'
                                 })
                                 .add();

                             // Arrow from Batik to SaaS client
                             ren
                                 .path([
                                     'M', 235, 185,
                                     'L', 235, 155,
                                     'C', 235, 130, 235, 130, 215, 130,
                                     'L', 95, 130,
                                     'L', 100, 125,
                                     'M', 95, 130,
                                     'L', 100, 135
                                 ])
                                 .attr({
                                     'stroke-width': 2,
                                     stroke: colors[3]
                                 })
                                 .add();

                             ren.label('Rasterized image', 100, 110)
                                 .css({
                                     color: colors[3],
                                     fontSize: '10px'
                                 })
                                 .add();

                             // Browser label
                             ren.label('Browser<br/>running<br/>Highcharts', 10, 180)
                                 .attr({
                                     fill: colors[0],
                                     stroke: 'white',
                                     'stroke-width': 2,
                                     padding: 5,
                                     r: 5
                                 })
                                 .css({
                                     color: 'white',
                                     width: '100px'
                                 })
                                 .add()
                                 .shadow(true);


                             // Arrow from Browser to Batik
                             ren.path(rightArrow)
                                 .attr({
                                     'stroke-width': 2,
                                     stroke: colors[1]
                                 })
                                 .translate(95, 205)
                                 .add();

                             ren.label('POST SVG', 110, 185)
                                 .css({
                                     color: colors[1],
                                     fontSize: '10px'
                                 })
                                 .add();

                             // Arrow from Batik to Browser
                             ren.path(leftArrow)
                                 .attr({
                                     'stroke-width': 2,
                                     stroke: colors[1]
                                 })
                                 .translate(95, 215)
                                 .add();

                             ren.label('Rasterized image', 100, 215)
                                 .css({
                                     color: colors[1],
                                     fontSize: '10px'
                                 })
                                 .add();

                             // Script label
                             ren.label('Script', 450, 82)
                                 .attr({
                                     fill: colors[2],
                                     stroke: 'white',
                                     'stroke-width': 2,
                                     padding: 5,
                                     r: 5
                                 })
                                 .css({
                                     color: 'white',
                                     width: '100px'
                                 })
                                 .add()
                                 .shadow(true);

                             // Arrow from Script to PhantomJS
                             ren.path(leftArrow)
                                 .attr({
                                     'stroke-width': 2,
                                     stroke: colors[2]
                                 })
                                 .translate(330, 90)
                                 .add();

                             ren.label('Command', 340, 70)
                                 .css({
                                     color: colors[2],
                                     fontSize: '10px'
                                 })
                                 .add();

                             // Arrow from PhantomJS to Script
                             ren.path(rightArrow)
                                 .attr({
                                     'stroke-width': 2,
                                     stroke: colors[2]
                                 })
                                 .translate(330, 100)
                                 .add();

                             ren.label('Rasterized image', 330, 100)
                                 .css({
                                     color: colors[2],
                                     fontSize: '10px'
                                 })
                                 .add();
                         }))))
              )
    .titleSet(AATitle.new
              .textSet(@"Highcharts export server overview")
              .styleSet(AAStyleColor(AAColor.blackColor)));
}


- (AAOptions *)advancedTimeLineChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .eventsSet(AAChartEvents.new
                       .loadSet(@AAJSFunc(function () {
                           var centerX = 140;
                           var centerY = 110;
                           var path = [];
                           var angle;
                           var radius;
                           var badgeColor = Highcharts.color(Highcharts.getOptions().colors[0]).brighten(-0.2).get();
                           var spike;
                           var empImage;
                           var big5;
                           var label;
                           var left;
                           var right;
                           var years;
                           var renderer;

                           if (this.chartWidth < 530) {
                               return;
                           }

                           // Draw the spiked disc
                           for (angle = 0; angle < 2 * Math.PI; angle += Math.PI / 24) {
                               radius = spike ? 80 : 70;
                               path.push(
                                   'L',
                                   centerX + radius * Math.cos(angle),
                                   centerY + radius * Math.sin(angle)
                               );
                               spike = !spike;
                           }
                           path[0] = 'M';
                           path.push('z');
                           this.renderer.path(path)
                               .attr({
                                   fill: badgeColor,
                                   zIndex: 6
                               })
                               .add();

                           // Employee image overlay
                           empImage = this.renderer.path(path)
                               .attr({
                                   zIndex: 7,
                                   opacity: 0,
                                   stroke: badgeColor,
                                   'stroke-width': 1
                               })
                               .add();

                           // Big 5
                           big5 = this.renderer.text('5')
                               .attr({
                                   zIndex: 6
                               })
                               .css({
                                   color: 'white',
                                   fontSize: '100px',
                                   fontStyle: 'italic',
                                   fontFamily: '\'Brush Script MT\', sans-serif'
                               })
                               .add();
                           big5.attr({
                               x: centerX - big5.getBBox().width / 2,
                               y: centerY + 14
                           });

                           // Draw the label
                           label = this.renderer.text('Highcharts Anniversary')
                               .attr({
                                   zIndex: 6
                               })
                               .css({
                                   color: '#FFFFFF'
                               })
                               .add();

                           left = centerX - label.getBBox().width / 2;
                           right = centerX + label.getBBox().width / 2;

                           label.attr({
                               x: left,
                               y: centerY + 44
                           });

                           // The band
                           left = centerX - 90;
                           right = centerX + 90;
                           this.renderer
                               .path([
                                   'M', left, centerY + 30,
                                   'L', right, centerY + 30,
                                   right, centerY + 50,
                                   left, centerY + 50,
                                   'z',
                                   'M', left, centerY + 40,
                                   'L', left - 20, centerY + 40,
                                   left - 10, centerY + 50,
                                   left - 20, centerY + 60,
                                   left + 10, centerY + 60,
                                   left, centerY + 50,
                                   left + 10, centerY + 60,
                                   left + 10, centerY + 50,
                                   left, centerY + 50,
                                   'z',
                                   'M', right, centerY + 40,
                                   'L', right + 20, centerY + 40,
                                   right + 10, centerY + 50,
                                   right + 20, centerY + 60,
                                   right - 10, centerY + 60,
                                   right, centerY + 50,
                                   right - 10, centerY + 60,
                                   right - 10, centerY + 50,
                                   right, centerY + 50,
                                   'z'
                               ])
                               .attr({
                                   fill: badgeColor,
                                   stroke: '#FFFFFF',
                                   'stroke-width': 1,
                                   zIndex: 5
                               })
                               .add();

                           // 2009-2014
                           years = this.renderer.text('2009-2014')
                               .attr({
                                   zIndex: 6
                               })
                               .css({
                                   color: '#FFFFFF',
                                   fontStyle: 'italic',
                                   fontSize: '10px'
                               })
                               .add();
                           years.attr({
                               x: centerX - years.getBBox().width / 2,
                               y: centerY + 62
                           });

                           // Prepare mouseover
                           renderer = this.renderer;
                           if (renderer.defs) { // is SVG
                               this.get('employees').points.forEach(point => {
                                   let pattern;
                                   if (point.image) {
                                       pattern = renderer.createElement('pattern').attr({
                                           id: 'pattern-' + point.image,
                                           patternUnits: 'userSpaceOnUse',
                                           width: 400,
                                           height: 400
                                       }).add(renderer.defs);
                                       renderer.image(
                                           'https://www.highcharts.com/images/employees2014/' + point.image + '.jpg',
                                           centerX - 80,
                                           centerY - 80,
                                           160,
                                           213
                                       ).add(pattern);

                                       Highcharts.addEvent(point, 'mouseOver', function () {
                                           empImage
                                               .attr({
                                                   fill: 'url(#pattern-' + point.image + ')'
                                               })
                                               .animate({ opacity: 1 }, { duration: 500 });
                                       });
                                       Highcharts.addEvent(point, 'mouseOut', function () {
                                           empImage.animate({ opacity: 0 }, { duration: 500 });
                                       });
                                   }
                               });
                           }
                       }))))
        .xAxisSet(AAXAxis.new
            .typeSet(AAChartAxisTypeDatetime)
            .minTickIntervalSet(@31536000000)
            .labelsSet(AALabels.new
                .alignSet(AAChartAlignTypeLeft))
            .plotBandsSet(@[
                AAPlotBandsElement.new
                    .fromSet(@1259280000000)
                    .toSet(@1291161600000)
                    .colorSet(@"#EFFFFF")
                    .labelSet(AALabel.new
                        .textSet(@"办事处:Torstein的地下室")
                        .styleSet(AAStyle.new
                            .colorSet(@"#999999"))
                        .ySet(@180)),
                AAPlotBandsElement.new
                    .fromSet(@1291161600000)
                    .toSet(@1380585600000)
                    .colorSet(@"#FFFFEF")
                    .labelSet(AALabel.new
                        .textSet(@"办事处:Tomtebu")
                        .styleSet(AAStyle.new
                            .colorSet(@"#999999"))
                        .ySet(@30)),
                AAPlotBandsElement.new
                    .fromSet(@1380585600000)
                    .toSet(@1417046400000)
                    .colorSet(@"#FFEFFF")
                    .labelSet(AALabel.new
                        .textSet(@"办事处:VikØrsta")
                        .styleSet(AAStyle.new
                            .colorSet(@"#999999"))
                        .ySet(@30))
                ]))
        .titleSet(AATitle.new
            .textSet(@"Highsoft 公司发展历程"))
        .tooltipSet(AATooltip.new
            .styleSet(AAStyle.new
                .widthSet((id)@"250px")))
        .yAxisSet((id)@[
            AAYAxis.new
                .maxSet(@100)
                .labelsSet(AALabels.new
                    .enabledSet(false))
                .titleSet(AAAxisTitle.new
                    .textSet(@""))
                .gridLineColorSet(@"rgba(0, 0, 0, 0.07)"),
            AAYAxis.new
                .allowDecimalsSet(false)
                .maxSet(@15)
                .labelsSet(AALabels.new
                    .styleSet(AAStyle.new
                        .colorSet(@"#90ed7d")))
                .titleSet(AAAxisTitle.new
                    .textSet(@"雇员")
                    .styleSet(AAStyle.new
                        .colorSet(@"#90ed7d")))
                .oppositeSet(true)
                .gridLineWidthSet(@0)
            ])
        .plotOptionsSet(AAPlotOptions.new
            .seriesSet(AASeries.new
                .markerSet(AAMarker.new
                    .enabledSet(false)
                    .symbolSet(AAChartSymbolTypeCircle)
                    .radiusSet(@2))
//                .fillOpacitySet(@0.5)
                       )
//            .flagsSet(AAFlags.new
//                .tooltipSet(AATooltip.new
//                    .xDateFormatSet(@"%B %e, %Y")))
                        )
        .seriesSet(@[
            AASeriesElement.new
                .typeSet(AAChartTypeLine)
                .idSet(@"google-trends")
                .dashStyleSet(AAChartLineDashStyleTypeLongDashDotDot)
                .nameSet(@"Google search for highcharts")
                .dataSet(@[
                    @{@"x": @1258322400000, /* November 2009 */ @"y": @0},
                    @{@"x": @1260961200000, @"y":  @5},
                    @{@"x": @1263639600000, @"y":  @7},
                    @{@"x": @1266188400000, @"y":  @5},
                    @{@"x": @1268740800000, @"y":  @6},
                    @{@"x": @1271368800000, @"y":  @8},
                    @{@"x": @1274004000000, @"y": @11},
                    @{@"x": @1276639200000, @"y":  @9},
                    @{@"x": @1279274400000, @"y": @12},
                    @{@"x": @1281952800000, @"y": @13},
                    @{@"x": @1284588000000, @"y": @17},
                    @{@"x": @1287223200000, @"y": @17},
                    @{@"x": @1289858400000, @"y": @18},
                    @{@"x": @1292497200000, @"y": @20},
                    @{@"x": @1295175600000, @"y": @20},
                    @{@"x": @1297724400000, @"y": @27},
                    @{@"x": @1300276800000, @"y": @32},
                    @{@"x": @1302904800000, @"y": @29},
                    @{@"x": @1305540000000, @"y": @34},
                    @{@"x": @1308175200000, @"y": @34},
                    @{@"x": @1310810400000, @"y": @36},
                    @{@"x": @1313488800000, @"y": @43},
                    @{@"x": @1316124000000, @"y": @44},
                    @{@"x": @1318759200000, @"y": @42},
                    @{@"x": @1321394400000, @"y": @47},
                    @{@"x": @1324033200000, @"y": @46},
                    @{@"x": @1326711600000, @"y": @50},
                    @{@"x": @1329303600000, @"y": @57},
                    @{@"x": @1331899200000, @"y": @54},
                    @{@"x": @1334527200000, @"y": @59},
                    @{@"x": @1337162400000, @"y": @62},
                    @{@"x": @1339797600000, @"y": @66},
                    @{@"x": @1342432800000, @"y": @61},
                    @{@"x": @1345111200000, @"y": @68},
                    @{@"x": @1347746400000, @"y": @67},
                    @{@"x": @1350381600000, @"y": @73},
                    @{@"x": @1353016800000, @"y": @63},
                    @{@"x": @1355655600000, @"y": @54},
                    @{@"x": @1358334000000, @"y": @67},
                    @{@"x": @1360882800000, @"y": @74},
                    @{@"x": @1363435200000, @"y": @81},
                    @{@"x": @1366063200000, @"y": @89},
                    @{@"x": @1368698400000, @"y": @83},
                    @{@"x": @1371333600000, @"y": @88},
                    @{@"x": @1373968800000, @"y": @86},
                    @{@"x": @1376647200000, @"y": @81},
                    @{@"x": @1379282400000, @"y": @83},
                    @{@"x": @1381917600000, @"y": @95},
                    @{@"x": @1384552800000, @"y": @86},
                    @{@"x": @1387191600000, @"y": @83},
                    @{@"x": @1389870000000, @"y": @89},
                    @{@"x": @1392418800000, @"y": @90},
                    @{@"x": @1394971200000, @"y": @94},
                    @{@"x": @1397599200000, @"y":@100},
                    @{@"x": @1400234400000, @"y":@100},
                    @{@"x": @1402869600000, @"y": @99},
                    @{@"x": @1405504800000, @"y": @99},
                    @{@"x": @1408183200000, @"y": @93},
                    @{@"x": @1410818400000, @"y": @97},
                    @{@"x": @1413453600000, @"y": @98}
                ])
                .tooltipSet(AATooltip.new
//                    .xDateFormatSet(@"%B %Y")
                    .valueSuffixSet(@" % of best month"))
            ,
            AASeriesElement.new
                .nameSet(@"收入")
//                .idSet(@"revenue")
                .typeSet(AAChartTypeArea)
                .dataSet(@[
                    @[@1257033600000,  @2],
                    @[@1259625600000,  @3],
                    @[@1262304000000,  @2],
                    @[@1264982400000,  @3],
                    @[@1267401600000,  @4],
                    @[@1270080000000,  @4],
                    @[@1272672000000,  @4],
                    @[@1275350400000,  @4],
                    @[@1277942400000,  @5],
                    @[@1280620800000,  @7],
                    @[@1283299200000,  @6],
                    @[@1285891200000,  @9],
                    @[@1288569600000, @10],
                    @[@1291161600000,  @8],
                    @[@1293840000000, @10],
                    @[@1296518400000, @13],
                    @[@1298937600000, @15],
                    @[@1301616000000, @14],
                    @[@1304208000000, @15],
                    @[@1306886400000, @16],
                    @[@1309478400000, @22],
                    @[@1312156800000, @19],
                    @[@1314835200000, @20],
                    @[@1317427200000, @32],
                    @[@1320105600000, @34],
                    @[@1322697600000, @36],
                    @[@1325376000000, @34],
                    @[@1328054400000, @40],
                    @[@1330560000000, @37],
                    @[@1333238400000, @35],
                    @[@1335830400000, @40],
                    @[@1338508800000, @38],
                    @[@1341100800000, @39],
                    @[@1343779200000, @43],
                    @[@1346457600000, @49],
                    @[@1349049600000, @43],
                    @[@1351728000000, @54],
                    @[@1354320000000, @44],
                    @[@1356998400000, @43],
                    @[@1359676800000, @43],
                    @[@1362096000000, @52],
                    @[@1364774400000, @52],
                    @[@1367366400000, @56],
                    @[@1370044800000, @62],
                    @[@1372636800000, @66],
                    @[@1375315200000, @62],
                    @[@1377993600000, @63],
                    @[@1380585600000, @60],
                    @[@1383264000000, @60],
                    @[@1385856000000, @58],
                    @[@1388534400000, @65],
                    @[@1391212800000, @52],
                    @[@1393632000000, @72],
                    @[@1396310400000, @57],
                    @[@1398902400000, @70],
                    @[@1401580800000, @63],
                    @[@1404172800000, @65],
                    @[@1406851200000, @65],
                    @[@1409529600000, @89],
                    @[@1412121600000,@100]
                    ])
                .tooltipSet(AATooltip.new
//                    .xDateFormatSet(@"%B %Y")
                    .valueSuffixSet(@" % of best month")
            )
    ,
            AASeriesElement.new
                .yAxisSet(@1)
                .nameSet(@"Highsoft 员工")
                .idSet(@"employees")
                .typeSet(AAChartTypeArea)
                .stepSet(@"left")
                .tooltipSet(AATooltip.new
                    .headerFormatSet(@"{point.x:%B %e, %Y}")
                    .pointFormatSet(@"{point.name}{point.y}")
                    .valueSuffixSet(@" employees"))
                .dataSet(@[
                    @{@"x": AADateUTC(2009, 10,  1), @"y": @1,  @"name": @"Torstein 一个人工作", @"image": @"Torstein" },
                    @{@"x": AADateUTC(2010, 10, 20), @"y": @2,  @"name": @"Grethe 加入", @"image": @"Grethe" },
                    @{@"x": AADateUTC(2011, 3,   1), @"y": @3,  @"name": @"Erik 加入", @"image": NSNull.new },
                    @{@"x": AADateUTC(2011, 7,   1), @"y": @4,  @"name": @"Gert 加入", @"image": @"Gert" },
                    @{@"x": AADateUTC(2011, 7,  15), @"y": @5,  @"name": @"Hilde 加入", @"image": @"Hilde" },
                    @{@"x": AADateUTC(2012, 5,   1), @"y": @6,  @"name": @"Guro 加入", @"image": @"Guro" },
                    @{@"x": AADateUTC(2012, 8,   1), @"y": @5,  @"name": @"Erik left", @"image": NSNull.new },
                    @{@"x": AADateUTC(2012, 8,  15), @"y": @6,  @"name": @"Anne Jorunn 加入", @"image": @"AnneJorunn" },
                    @{@"x": AADateUTC(2013, 0,   1), @"y": @7,  @"name": @"Hilde T. 加入", @"image": NSNull.new },
                    @{@"x": AADateUTC(2013, 7,   1), @"y": @8,  @"name": @"Jon Arild 加入", @"image": @"JonArild" },
                    @{@"x": AADateUTC(2013, 7,  20), @"y": @9,  @"name": @"Øystein 加入", @"image": @"Oystein" },
                    @{@"x": AADateUTC(2013, 9,   1), @"y": @10, @"name": @"Stephane 加入", @"image": @"Stephane" },
                    @{@"x": AADateUTC(2014, 9,   1), @"y": @11, @"name": @"Anita 加入", @"image": @"Anita" },
                    @{@"x": AADateUTC(2014, 10, 27), @"y": @11, @"name": @"", @"image": NSNull.new}
                ])
            ]);

}

//https://github.com/AAChartModel/AAChartKit-Swift/issues/394
//https://www.highcharts.com/forum/viewtopic.php?t=44985
- (AAOptions *)configureBlinkMarkerChart {
    NSArray *dataArr = @[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6];
    NSInteger selectedIndex = dataArr.count - 1;
    return AAOptions.new
            .chartSet(AAChart.new
                    .eventsSet(AAChartEvents.new
                            .loadSet([NSString stringWithFormat:@AAJSFunc(function() {
                                const chart = this;
                                const point = chart.series[0].points[%ld];
                                let big = true;
                                setInterval(() => {
                                        big = !big;
                                        point.update({
                                            marker: {
                                            radius: big ? 5 : 15
                                        }
                                        })
                                }, 500);
                            }),selectedIndex])
                               ))
            .seriesSet(@[
                    AASeriesElement.new
                            .dataSet(dataArr)
                            .markerSet(AAMarker.new
                                    .lineColorSet(AAColor.redColor)
                                    .lineWidthSet(@3)
                                    .radiusSet(@10))
            ]);
}

//https://github.com/AAChartModel/AAChartKit-Swift/issues/394
//https://www.highcharts.com/forum/viewtopic.php?t=44985
- (AAOptions *)configureSpecialStyleMarkerOfSingleDataElementChartWithBlinkEffect {
    NSArray *stopsArr = @[
            @[@0.00, @"#febc0f"],//颜色字符串设置支持十六进制类型和 rgba 类型
            @[@0.25, @"#FF14d4"],
            @[@0.50, @"#0bf8f5"],
            @[@0.75, @"#F33c52"],
            @[@1.00, @"#1904dd"],
    ];

    NSDictionary *gradientColorDic1 =
            [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToRight
                                             stopsArray:stopsArr];

    AADataElement *singleSpecialData = AADataElement.new
            .markerSet(AAMarker.new
                    .radiusSet(@8)//曲线连接点半径
                    .symbolSet(AAChartSymbolTypeCircle)//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                    .fillColorSet(AAColor.whiteColor)//点的填充色(用来设置折线连接点的填充色)
                    .lineWidthSet(@5)//外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                            //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色)
                    .lineColorSet(AAColor.redColor)
            )
            .ySet(@26.5);

    AAChartModel *aaChartModel = AAChartModel.new
            .chartTypeSet(AAChartTypeSpline)
            .backgroundColorSet(@"#4b2b7f")
            .dataLabelsEnabledSet(false)//是否显示值
            .tooltipEnabledSet(true)
            .markerRadiusSet(@0)
            .xAxisVisibleSet(false)
            .yAxisVisibleSet(false)
            .seriesSet(@[
                    AASeriesElement.new
                            .nameSet(@"Virtual Data")
                            .lineWidthSet(@6)
                            .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, singleSpecialData, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
                            .colorSet((id)gradientColorDic1)
            ]);
    NSInteger selectedIndex = 11;
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.chart.events = AAChartEvents.new
           .loadSet([NSString stringWithFormat:@AAJSFunc(
                     function () {
                          const chart = this;
                          const point = chart.series[0].points[%ld];
                          let big = true;
                          setInterval(() => {
                                 big = !big;
                                 point.update({
                                      marker: {
                                        radius: big ? 5 : 55,
                                        fillColor: big ? "white": "red",
                                        lineWidth: big ? 5 : 15,
                                        lineColor: big ? "green": "yellow",
                                      }
                                 })
                          }, 500)
                     }
                     ), (long)selectedIndex]);
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit-Swift/issues/394
//https://echarts.apache.org/examples/zh/editor.html?c=scatter-effect
- (AAOptions *)configureScatterChartWithBlinkEffect {
    AAChartModel *aaChartModel = AAChartModel.new
            .chartTypeSet(AAChartTypeScatter)
            .titleSet(@"按性别划分的身高体重分布图")
            .yAxisTitleSet(@"千克(kg)")
            .markerRadiusSet(@9)
            .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
            .colorsThemeSet(@[@"#c3b1fb",@"#e70b2d",])
            .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
            .markerSymbolSet(AAChartSymbolTypeCircle)
            .markerRadiusSet(@9)
            .backgroundColorSet(AAColor.blackColor)
            .seriesSet(@[
                    AASeriesElement.new
                            .nameSet(@"Blink Scatter")
                            .colorSet(AAColor.greenColor)
                            .dataSet(@[
                                    @[@172.7, @105.2],
                                    @[@153.4, @42]
                            ])
                                    ,
                    AASeriesElement.new
                            .nameSet(@"女")
                            .dataSet(@[
                                    @[@174.0, @65.6], @[@175.3, @71.8], @[@193.5, @80.7], @[@186.5, @72.6], @[@187.2, @78.8],
                                    @[@181.5, @74.8], @[@184.0, @86.4], @[@184.5, @78.4], @[@175.0, @62.0], @[@184.0, @81.6],
                                    @[@180.0, @76.6], @[@177.8, @83.6], @[@192.0, @90.0], @[@176.0, @74.6], @[@174.0, @71.0],
                                    @[@184.0, @79.6], @[@192.7, @93.8], @[@171.5, @70.0], @[@173.0, @72.4], @[@176.0, @85.9],
                                    @[@176.0, @78.8], @[@180.5, @77.8], @[@172.7, @66.2], @[@176.0, @86.4], @[@173.5, @81.8],
                                    @[@178.0, @89.6], @[@180.3, @82.8], @[@180.3, @76.4], @[@164.5, @63.2], @[@173.0, @60.9],
                                    @[@183.5, @74.8], @[@175.5, @70.0], @[@188.0, @72.4], @[@189.2, @84.1], @[@172.8, @69.1],
                                    @[@170.0, @59.5], @[@182.0, @67.2], @[@170.0, @61.3], @[@177.8, @68.6], @[@184.2, @80.1],
                                    @[@186.7, @87.8], @[@171.4, @84.7], @[@172.7, @73.4], @[@175.3, @72.1], @[@180.3, @82.6],
                                    @[@182.9, @88.7], @[@188.0, @84.1], @[@177.2, @94.1], @[@172.1, @74.9], @[@167.0, @59.1],
                                    @[@169.5, @75.6], @[@174.0, @86.2], @[@172.7, @75.3], @[@182.2, @87.1], @[@164.1, @55.2],
                                    @[@163.0, @57.0], @[@171.5, @61.4], @[@184.2, @76.8], @[@174.0, @86.8], @[@174.0, @72.2],
                                    @[@177.0, @71.6], @[@186.0, @84.8], @[@167.0, @68.2], @[@171.8, @66.1], @[@182.0, @72.0],
                                    @[@167.0, @64.6], @[@177.8, @74.8], @[@164.5, @70.0], @[@192.0, @92.2], @[@175.5, @63.2],
                                    @[@171.2, @79.1], @[@181.6, @78.9], @[@167.4, @67.7], @[@181.1, @66.0], @[@177.0, @68.2],
                                    @[@174.5, @63.9], @[@177.5, @72.0], @[@170.5, @56.8], @[@182.4, @74.5], @[@197.1, @90.9],
                                    @[@180.1, @93.0], @[@175.5, @80.9], @[@180.6, @72.7], @[@184.4, @68.0], @[@175.5, @70.9],
                                    @[@180.6, @72.5], @[@177.0, @72.5], @[@177.1, @83.4], @[@181.6, @75.5], @[@176.5, @73.0],
                                    @[@175.0, @70.2], @[@174.0, @73.4], @[@165.1, @70.5], @[@177.0, @68.9], @[@192.0, @99.9],
                                    @[@176.5, @68.4], @[@169.4, @65.9], @[@182.1, @75.7], @[@179.8, @84.5], @[@175.3, @87.7],
                                    @[@184.9, @86.4], @[@177.3, @73.2], @[@167.4, @53.9], @[@178.1, @72.0], @[@168.9, @55.5],
                                    @[@157.2, @58.4], @[@180.3, @83.2], @[@170.2, @72.7], @[@177.8, @64.1], @[@172.7, @72.3],
                                    @[@165.1, @65.0], @[@186.7, @86.4], @[@165.1, @65.0], @[@174.0, @88.6], @[@175.3, @84.1],
                                    @[@185.4, @66.8], @[@177.8, @75.5], @[@180.3, @93.2], @[@180.3, @82.7], @[@177.8, @58.0],
                                    @[@177.8, @79.5], @[@177.8, @78.6], @[@177.8, @71.8], @[@177.8, @99.0], @[@163.8, @72.2],
                                    @[@188.0, @83.6], @[@198.1, @85.5], @[@175.3, @90.9], @[@166.4, @85.9], @[@190.5, @89.1],
                                    @[@166.4, @75.0], @[@177.8, @77.7], @[@179.7, @86.4], @[@172.7, @90.9], @[@190.5, @73.6],
                                    @[@185.4, @76.4], @[@168.9, @69.1], @[@167.6, @84.5], @[@175.3, @64.5], @[@170.2, @69.1],
                                    @[@190.5, @96.6], @[@177.8, @86.4], @[@190.5, @80.9], @[@177.8, @87.7], @[@184.2, @94.5],
                                    @[@176.5, @80.2], @[@177.8, @72.0], @[@180.3, @71.4], @[@171.4, @72.7], @[@172.7, @84.1],
                                    @[@172.7, @76.8], @[@177.8, @63.6], @[@177.8, @80.9], @[@182.9, @80.9], @[@170.2, @85.5],
                                    @[@167.6, @68.6], @[@175.3, @67.7], @[@165.1, @66.4], @[@185.4, @99.9], @[@181.6, @70.5],
                                    @[@172.7, @95.9], @[@190.5, @84.1], @[@179.1, @87.3], @[@175.3, @71.8], @[@170.2, @65.9],
                                    @[@193.0, @95.9], @[@171.4, @91.4], @[@177.8, @81.8], @[@177.8, @96.8], @[@167.6, @69.1],
                                    @[@167.6, @82.7], @[@180.3, @75.5], @[@182.9, @79.5], @[@176.5, @73.6], @[@186.7, @91.8],
                                    @[@188.0, @84.1], @[@188.0, @85.9], @[@177.8, @81.8], @[@174.0, @82.5], @[@177.8, @80.5],
                                    @[@171.4, @70.0], @[@185.4, @81.8], @[@185.4, @84.1], @[@188.0, @90.5], @[@188.0, @91.4],
                                    @[@182.9, @89.1], @[@176.5, @85.0], @[@175.3, @69.1], @[@175.3, @73.6], @[@188.0, @80.5],
                                    @[@188.0, @82.7], @[@175.3, @86.4], @[@170.5, @67.7], @[@179.1, @92.7], @[@177.8, @93.6],
                                    @[@175.3, @70.9], @[@182.9, @75.0], @[@170.8, @93.2], @[@188.0, @93.2], @[@180.3, @77.7],
                                    @[@177.8, @61.4], @[@185.4, @94.1], @[@168.9, @75.0], @[@185.4, @83.6], @[@180.3, @85.5],
                                    @[@174.0, @73.9], @[@167.6, @66.8], @[@182.9, @87.3], @[@160.0, @72.3], @[@180.3, @88.6],
                                    @[@167.6, @75.5], @[@186.7, @95.5], @[@175.3, @91.1], @[@175.3, @67.3], @[@175.9, @77.7],
                                    @[@175.3, @81.8], @[@179.1, @75.5], @[@181.6, @84.5], @[@177.8, @76.6], @[@182.9, @85.0],
                                    @[@177.8, @98.8], @[@184.2, @77.3], @[@179.1, @71.8], @[@176.5, @87.9], @[@188.0, @94.3],
                                    @[@174.0, @70.9], @[@167.6, @64.5], @[@170.2, @77.3], @[@167.6, @72.3], @[@188.0, @87.3],
                                    @[@174.0, @80.0], @[@176.5, @82.3], @[@180.3, @73.6], @[@167.6, @74.1], @[@188.0, @85.9],
                                    @[@180.3, @73.2], @[@167.6, @76.3], @[@183.0, @65.9], @[@183.0, @90.9], @[@179.1, @89.1],
                                    @[@170.2, @62.3], @[@177.8, @82.7], @[@179.1, @79.1], @[@190.5, @98.2], @[@177.8, @84.1],
                                    @[@180.3, @83.2], @[@180.3, @83.2]
                            ])
            ]);
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    aaOptions.chart.eventsSet(
            AAChartEvents.new
            .loadSet(@AAJSFunc(function() {
                const chart = this;
                const blinkScatterPointsArr = chart.series[0].points;
                const range = blinkScatterPointsArr.length;
                for (let i = 0; i < range; i++) {
                    const point = blinkScatterPointsArr[i];
                    let big = true;
                    setInterval(() => {
                            big = !big;
                            point.update({
                                marker: {
                                radius: big ? 5 : 25,
                                    fillColor: big ? "pink": "red",
                                        lineWidth: big ? 5 : 15,
                                        lineColor: big ? "gold": "yellow",
                            }
                            })
                    }, 600)
                }
            })));
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/1093
//https://github.com/highcharts/highcharts-ios/issues/97
- (AAOptions *)automaticallyHideTooltipAfterItIsShown {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图表类型
    .colorsThemeSet(@[@"#04d69f", @"#1e90ff", @"#ef476f", @"#ffd066",])
    .markerRadiusSet(@6)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .categoriesSet(@[
        @"Java", @"Swift", @"Python", @"Ruby", @"PHP", @"Go",
        @"C", @"C#", @"C++", @"Perl", @"R", @"MATLAB", @"SQL"
    ])//设置 X 轴坐标文字内容
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
    
    AAOptions *aaOptions = aaChartModel.aa_toAAOptions;
    
    aaOptions.tooltip
        .styleSet(AAStyleColor(AAColor.whiteColor))
        .backgroundColorSet(@"#050505")
        .borderColorSet(AAColor.redColor);
    
    aaOptions.xAxis
        .crosshairSet(AACrosshair.new
            .colorSet(AAColor.darkGrayColor)
            .dashStyleSet(AAChartLineDashStyleTypeLongDashDotDot)
            .widthSet(@2));
    
    //https://api.highcharts.com/highcharts/chart.events.load
    aaOptions.chart
        .eventsSet(AAChartEvents.new
            .loadSet(@AAJSFunc(function () {
                const chart = this;
                Highcharts.addEvent(
                    chart.tooltip,
                    'refresh',
                    function () {
                        //设置 tooltip 自动隐藏的时间
                        chart.tooltip.hide(888);
                });
            })));
    
    return aaOptions;
}

//https://github.com/AAChartModel/AAChartKit/issues/1383
//https://www.highcharts.com/forum/viewtopic.php?t=49409
- (AAOptions *)dynamicHeightGridLineAreaChart {
    return AAOptions.new
    .titleSet(AATitle.new
              .textSet(@"dynamicHeightGridLineAreaChart"))
    .chartSet(AAChart.new
        .typeSet(AAChartTypeScatter)
        .eventsSet(AAChartEvents.new
            .loadSet(@AAJSFunc(function () {
                const chart = this;
                const mainSeries = chart.series[0];
                mainSeries.data.forEach((point, i) => {
                  chart.addSeries({
                    data: [
                      [i, 0],
                      [i, point.y]
                    ]
                  })
                })
              }))))
    .plotOptionsSet(AAPlotOptions.new
        .scatterSet(AAScatter.new
            .lineWidthSet(@2)
            .lineColorSet(@"#dbe751")
            .dashStyleSet(AAChartLineDashStyleTypeLongDash)
            .enableMouseTrackingSet(@false)
            .linkedToSet(@"main")
            .statesSet(AAStates.new
                .inactiveSet(AAInactive.new
                    .enabledSet(false)))
            .markerSet(AAMarker.new
                .enabledSet(false))))
    .yAxisSet(AAYAxis.new
              .gridLineWidthSet(@0))
    .seriesSet(@[
        AASeriesElement.new
            .typeSet(AAChartTypeAreaspline)
            .idSet(@"main")
            .dataSet(@[@7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6])
            .lineWidthSet(@6)
            .colorSet(@"#dbe751")
            .fillOpacitySet(@0.4)
            .markerSet(AAMarker.new
                .enabledSet(false))
    ]);
}

//https://github.com/AAChartModel/AAChartKit-Swift-Pro/issues/3
//https://www.highcharts.com/forum/viewtopic.php?f=9&t=49492
- (AAOptions *)customizeYAxisPlotLinesLabelBeSpecialStyle {
    return AAOptions.new
    .chartSet(AAChart.new
            .eventsSet(AAChartEvents.new
                       .loadSet(@AAJSFunc((function () {
                           const chart = this,
                             ren = chart.renderer,
                             plotLineLabel = chart.yAxis[0].plotLinesAndBands[0].label,
                             {
                               x: labelX,
                               y: labelY,
                               width: labelWidth,
                               height: labelHeight
                             } = plotLineLabel.getBBox(),
                             x = labelX + labelWidth,
                             y = labelY,
                             lh = labelHeight,
                             ll = 40;

                           chart.customLabelTriangle = ren.path(['M', x - ll, y, x, y, x + lh, y + lh / 2, x, y + lh, x - ll, y + lh, 'Z']).attr({
                             fill: '#a9a9ff',
                           }).add().toFront();
                       })))))
    .yAxisSet(AAYAxis.new
        .visibleSet(true)
        .lineWidthSet(@2)
        .plotLinesSet(@[
            AAPlotLinesElement.new
            .valueSet(@6.5)
            .colorSet(@"#a9a9ff")
            .widthSet(@2)
            .dashStyleSet(AAChartLineDashStyleTypeDash)
            .labelSet(AALabel.new
                .useHTMLSet(true)
                .textAlignSet(AAChartAlignTypeCenter)
                .xSet(@0)
                .ySet(@2)
                .formatterSet(@AAJSFunc(function () {
                    return `<span style="padding: 2px 10px; display: block; color: white">${this.options.value}</span>`
                }))
            )
        ])
    )
    .seriesSet(@[
        AASeriesElement.new
        .dataSet(@[@2, @5, @2, @3, @6])
    ]);
}

//https://stackoverflow.com/questions/47392848/set-ecg-paper-like-grid-intervals-highcharts-js
//var axesOptions = {
//  tickInterval: 0.5,
//  minorTicks: true,
//  minorTickInterval: 0.1,
//  gridLineWidth: 1,
//  gridLineColor: 'red'
//};
//
//
//var chart = Highcharts.chart('container', {
//
//  chart: {
//    events: {
//      render: function() {
//
//        var axes = this.axes,
//          showMinorTicks = true;
//
//        // find if minor ticks are present on both axes
//        axes.forEach(function(a) {
//          console.log(a.minorTicks);
//
//          if (Object.keys(a.minorTicks).length === 0) {
//            showMinorTicks = false;
//          }
//        });
//
//        // hide/show ticks
//        axes.forEach(function(a) {
//          for (var key in a.minorTicks) {
//            var mt = a.minorTicks[key].gridLine;
//            showMinorTicks ? mt.show() : mt.hide();
//          }
//        });
//      }
//    }
//  },
//
//  xAxis: axesOptions,
//  yAxis: axesOptions,
//
//  series: [{
//    data: [1, 3, 4, 6, 1, 2, 2, 6, 1, 1, 1, 4, 6]
//  }]
//});

//https://stackoverflow.com/questions/47392848/set-ecg-paper-like-grid-intervals-highcharts-js
- (AAOptions *)configureECGStyleChart {
    AAXAxis *axesOptions = AAXAxis.new
            .tickIntervalSet(@0.5)
            .minorTicksSet(@true)
            .minorTickIntervalSet(@0.1)
            .gridLineWidthSet(@1)
            .gridLineColorSet(@"red");

    return AAOptions.new
            .titleSet(AATitle.new
                    .textSet(@"ECG Paper Style Chart"))
            .chartSet(AAChart.new
                    .eventsSet(AAChartEvents.new
                            .renderSet(@AAJSFunc((function () {
                                const chart = this;
                                const axes = chart.axes;
                                let showMinorTicks = true;

                                // find if minor ticks are present on both axes
                                axes.forEach((a) => {
                                        if (Object.keys(a.minorTicks).length === 0) {
                                            showMinorTicks = false;
                                        }
                                });

                                // hide/show ticks
                                axes.forEach((a) => {
                                        for (var key in a.minorTicks) {
                                            var mt = a.minorTicks[key].gridLine;
                                            showMinorTicks ? mt.show() : mt.hide();
                                        }
                                });
                            }))))
            )
            .xAxisSet(axesOptions)
            .yAxisSet((id)axesOptions)
            .seriesSet(@[
                    AASeriesElement.new
                            .dataSet(@[@1, @3, @4, @6, @1, @2, @2, @6, @1, @1, @1, @4, @6])
            ]);

}

//https://www.highcharts.com/forum/viewtopic.php?t=28267
//    $(function () {
//    $('#container').highcharts({
//        chart: {
//            events: {
//                load: function (){
//                    console.log( );
//                    var graphic = this.series[0].data[0].graphic;
//                    setTimeout(function() {
//                        var prevR = graphic.r;
//                        graphic.attr( {
//                            r: prevR + 50
//                        });
//                }, 1001);
//                }
//            }
//        },
//        series: [{
//            type: 'pie',
//            name: 'Browser share',
//            data: [
//                ['Firefox',   45.0],
//                ['IE',       26.8],
//                ['Safari',    8.5],
//                ['Opera',     6.2],
//                ['Others',   0.7]
//            ]
//        }]
//    });
//});

//https://github.com/AAChartModel/AAChartKit/issues/1449
//https://www.highcharts.com/forum/viewtopic.php?t=28267
- (AAOptions *)configureTheSizeOfTheSliceOfDonutAndPieChart {
    return AAOptions.new
            .titleSet(AATitle.new
                    .textSet(@"Configure The Size Of The Slice Of Donut And Pie Chart"))
            .chartSet(AAChart.new
                    .eventsSet(AAChartEvents.new
                            .loadSet(@AAJSFunc((function () {
                                const chart = this;
                                const graphic = chart.series[0].data[0].graphic;
                                setTimeout(function () {
                                    const prevR = graphic.r;
                                    graphic.attr({
                                        r: prevR + 50
                                    });
                                }, 1001);
                            }))))
            )
            .seriesSet(@[
                    AASeriesElement.new
                            .typeSet(AAChartTypePie)
                            .nameSet(@"Browser share")
                            .dataSet(@[
                                    @[@"Firefox", @45.0],
                                    @[@"IE", @26.8],
                                    @[@"Safari", @8.5],
                                    @[@"Opera", @6.2],
                                    @[@"Others", @0.7]
                            ])
            ]);
}

//// create the chart
//Highcharts.chart('container', {
//    chart: {
//        events: {
//            click: function (event) {
//                var label = this.renderer.label(
//                    'x: ' + Highcharts.numberFormat(event.xAxis[0].value, 2) + ', y: ' + Highcharts.numberFormat(event.yAxis[0].value, 2),
//                    event.xAxis[0].axis.toPixels(event.xAxis[0].value),
//                    event.yAxis[0].axis.toPixels(event.yAxis[0].value)
//                )
//                    .attr({
//                        fill: Highcharts.getOptions().colors[0],
//                        padding: 10,
//                        r: 5,
//                        zIndex: 8
//                    })
//                    .css({
//                        color: '#FFFFFF'
//                    })
//                    .add();
//
//                setTimeout(function () {
//                    label.fadeOut();
//                }, 1000);
//            }
//        }
//    },
//
//    series: [{
//        data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
//    }]
//});

//https://api.highcharts.com/highcharts/chart.events.click
- (AAOptions *)configurePlotBackgroundClickEvent {
    return AAOptions.new
            .titleSet(AATitle.new
                    .textSet(@"configure Plot Background Click Event"))
            .chartSet(AAChart.new
                    .eventsSet(AAChartEvents.new
                            .clickSet(@AAJSFunc((function () {
                                const label = this.renderer.label(
                                        'x: ' + Highcharts.numberFormat(event.xAxis[0].value, 2) + ', y: ' + Highcharts.numberFormat(event.yAxis[0].value, 2),
                                        event.xAxis[0].axis.toPixels(event.xAxis[0].value),
                                        event.yAxis[0].axis.toPixels(event.yAxis[0].value)
                                )
                                        .attr({
                                            fill: Highcharts.getOptions().colors[0],
                                            padding: 10,
                                            r: 5,
                                            zIndex: 8
                                        })
                                        .css({
                                            color: '#FFFFFF'
                                        })
                                        .add();

                                setTimeout(function () {
                                    label.fadeOut();
                                }, 1000);
                            }))))
            )
            .seriesSet(@[
                    AASeriesElement.new
                            .dataSet(@[@29.9, @71.5, @106.4, @129.2, @144.0, @176.0, @135.6, @148.5, @216.4, @194.1, @95.6, @54.4])
            ]);
}

@end
