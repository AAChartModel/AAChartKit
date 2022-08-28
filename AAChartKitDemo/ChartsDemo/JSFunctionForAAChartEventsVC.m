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
        case 0: return [self setCrosshairAndTooltipToTheDefaultPositionAfterLoadingChart];
        case 1: return [self generalDrawingChart];
        case 2: return [self advancedTimeLineChart];
        case 3: return [self configureBlinkMarkerChart];
        case 4: return [self configureSpecialStyleMarkerOfSingleDataElementChartWithBlinkEffect];
        case 5: return [self configureScatterChartWithBlinkEffect];
        case 6: return [self densityChart];
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
                let points = [];
                let chart = this;
                let series = chart.series;
                let length = series.length;
                           
                for (let i = 0; i < length; i++) {
                    let pointElement = series[i].data[%ld];
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
//                .idSet(@"google-trends")
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
//                .tooltipSet(AATooltip.new
//                    .xDateFormatSet(@"%B %Y")
//                    .valueSuffixSet(@" % of best month"))
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
//                .tooltipSet(AATooltip.new
//                    .xDateFormatSet(@"%B %Y")
//                    .valueSuffixSet(@" % of best month")
//            )
    ,
            AASeriesElement.new
                .yAxisSet(@1)
                .nameSet(@"Highsoft 员工")
//                .idSet(@"employees")
                .typeSet(AAChartTypeArea)
                .stepSet(@"left")
//                .tooltipSet(AATooltip.new
//                    .headerFormatSet(@"{point.x:%B %e, %Y}")
//                    .pointFormatSet(@"{point.name}{point.y}")
//                    .valueSuffixSet(@" employees"))
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

- (AAOptions *)densityChart {
    return AAOptions.new
        .chartSet(AAChart.new
            .typeSet(AAChartTypeAreasplinerange)
            .animationSet((id)@true)
//            .eventsSet(AAEvents.new
//                .renderSet(@AAJSFunc(render() {
//                     if (!redrawing) {
//                     redrawing = true;
//
//                     this.series.forEach((s) => {
//                     s.update({
//                     fillColor: {
//                     linearGradient: [0, 0, this.plotWidth, 0],
//                     stops: [
//                     [0, Highcharts.color("yellow").setOpacity(0).get("rgba")],
//                     [0.25, "#FFA500"], //orange
//                     [0.5, "#FF0033"], //red
//                     [0.75, "#7A378B"] //purple
//                     ]
//                     }
//                     });
//                     });
//                     redrawing = false;
//                     }
//                     })))
                  )
        .titleSet(AATitle.new
            .textSet(@"The 2012 Olympic male athletes weight"))
        .xAxisSet(AAXAxis.new
            .labelsSet(AALabels.new
                .formatSet(@"{value} kg")))
        .yAxisSet(AAYAxis.new
            .titleSet(AAAxisTitle.new
                .textSet((id)NSNull.new))
            .categoriesSet(@[@"triathlon", @"badminton", @"fencing", @"rowing", @"handball", @"cycling", @"gymnastics", ])
            .maxSet(@7)
            .labelsSet(AALabels.new
//                .formatterSet(@AAJSFunc(function () {
//                     if (this.pos < chartsNbr) return this.value;
//                     }))
                .styleSet(AAStyle.new
//                    .textTransformSet(@"capitalize")
                    .fontSizeSet(@"9px")))
            .startOnTickSet(true)
            .gridLineWidthSet(@1)
//            .tickmarkPlacementSet(@"on")
                  )
        .tooltipSet(AATooltip.new
            .useHTMLSet(true)
            .sharedSet(true)
//            .crosshairsSet(true)
            .valueDecimalsSet(@3)
            .headerFormatSet((id)NSNull.new)
            .pointFormatSet(@"{series.name}: {point.x} kg")
            .footerFormatSet((id)NSNull.new))
        .plotOptionsSet(AAPlotOptions.new
            .seriesSet(AASeries.new
                .markerSet(AAMarker.new
                    .enabledSet(false))
                .statesSet(AAStates.new
                    .hoverSet(AAHover.new
                        .enabledSet(false)))
//                .pointStartSet(@44)
                .animationSet(AAAnimation.new
                    .durationSet(@0))
//                .fillColorSet(@"")
//                .lineWidthSet(@1)
//                .colorSet(AAColor.blackColor)
                       )
                        )
        .legendSet(AALegend.new
            .enabledSet(false))
        .seriesSet(@[
            AASeriesElement.new
                .dataSet(@[
                    @[@44, NSNull.new, NSNull.new],
                    @[@45, NSNull.new, NSNull.new],
                    @[@46, NSNull.new, NSNull.new],
                    @[@47, NSNull.new, NSNull.new],
                    @[@48, NSNull.new, NSNull.new],
                    @[@49, NSNull.new, NSNull.new],
                    @[@50, @0, @1.6877452366331652e-9],
                    @[@51, @0, @4.1297764578913784e-7],
                    @[@52, @0, @0.00003717506779012079],
                    @[@53, @0, @0.0012310723838870445],
                    @[@54, @0, @0.014998320039038131],
                    @[@55, @0, @0.0672892729835134],
                    @[@56, @0, @0.11335544522245715],
                    @[@57, @0, @0.09982115212155934],
                    @[@58, @0, @0.18445728968619637],
                    @[@59, @0, @0.42105386081291307],
                    @[@60, @0, @0.6726372821447041],
                    @[@61, @0, @0.847014259504697],
                    @[@62, @0, @0.8680654758842888],
                    @[@63, @0, @1.0104112132605019],
                    @[@64, @0, @1.4058029248800494],
                    @[@65, @0, @1.4384437760269786],
                    @[@66, @0, @0.9766809715955158],
                    @[@67, @0, @0.7151468889519612],
                    @[@68, @0, @0.7550462665856931],
                    @[@69, @0, @0.9864022751930683],
                    @[@70, @0, @1.0423928621398917],
                    @[@71, @0, @0.6699901785395204],
                    @[@72, @0, @0.42882638809779355],
                    @[@73, @0, @0.4034385803495019],
                    @[@74, @0, @0.3875878883940842],
                    @[@75, @0, @0.2789741527582574],
                    @[@76, @0, @0.1819943273993376],
                    @[@77, @0, @0.21175757969764405],
                    @[@78, @0, @0.2615488065799142],
                    @[@79, @0, @0.2602809738088483],
                    @[@80, @0, @0.19426036631281313],
                    @[@81, @0, @0.08347982660116433],
                    @[@82, @0, @0.016266147744319587],
                    @[@83, @0, @0.0012686587314182031],
                    @[@84, @0, @0.000037589730638108584],
                    @[@85, @0, @4.146679270435557e-7],
                    @[@86, @0, @1.6902840620918643e-9],
                    @[@87, NSNull.new, NSNull.new],
                    @[@88, NSNull.new, NSNull.new],
                    @[@89, NSNull.new, NSNull.new],
                    @[@90, NSNull.new, NSNull.new],
                    @[@91, NSNull.new, NSNull.new],
                    @[@92, NSNull.new, NSNull.new],
                    @[@93, NSNull.new, NSNull.new],
                    @[@94, NSNull.new, NSNull.new],
                    @[@95, NSNull.new, NSNull.new],
                    @[@96, NSNull.new, NSNull.new],
                    @[@97, NSNull.new, NSNull.new],
                    @[@98, NSNull.new, NSNull.new],
                    @[@99, NSNull.new, NSNull.new],
                    @[@100, NSNull.new, NSNull.new],
                    @[@101, NSNull.new, NSNull.new],
                    @[@102, NSNull.new, NSNull.new],
                    @[@103, NSNull.new, NSNull.new],
                    @[@104, NSNull.new, NSNull.new],
                    @[@105, NSNull.new, NSNull.new],
                    @[@106, NSNull.new, NSNull.new],
                    @[@107, NSNull.new, NSNull.new],
                    @[@108, NSNull.new, NSNull.new],
                    @[@109, NSNull.new, NSNull.new],
                    @[@110, NSNull.new, NSNull.new],
                    @[@111, NSNull.new, NSNull.new],
                    @[@112, NSNull.new, NSNull.new],
                    @[@113, NSNull.new, NSNull.new],
                    @[@114, NSNull.new, NSNull.new],
                    @[@115, NSNull.new, NSNull.new],
                    @[@116, NSNull.new, NSNull.new],
                    @[@117, NSNull.new, NSNull.new],
                    @[@118, NSNull.new, NSNull.new],
                    @[@119, NSNull.new, NSNull.new],
                    @[@120, NSNull.new, NSNull.new],
                    @[@121, NSNull.new, NSNull.new],
                    @[@122, NSNull.new, NSNull.new],
                    @[@123, NSNull.new, NSNull.new]
                    ])
                .nameSet(@"triathlon")
                .zIndexSet(@7),
            AASeriesElement.new
                .dataSet(@[
                    @[@44, NSNull.new, NSNull.new],
                    @[@45, NSNull.new, NSNull.new],
                    @[@46, NSNull.new, NSNull.new],
                    @[@47, NSNull.new, NSNull.new],
                    @[@48, NSNull.new, NSNull.new],
                    @[@49, NSNull.new, NSNull.new],
                    @[@50, NSNull.new, NSNull.new],
                    @[@51, NSNull.new, NSNull.new],
                    @[@52, NSNull.new, NSNull.new],
                    @[@53, NSNull.new, NSNull.new],
                    @[@54, @1, @1.000000002197753],
                    @[@55, @1, @1.0000005384665505],
                    @[@56, @1, @1.000048641055009],
                    @[@57, @1, @1.0016260591070094],
                    @[@58, @1, @1.020315744734784],
                    @[@59, @1, @1.097216972487691],
                    @[@60, @1, @1.1879503786257903],
                    @[@61, @1, @1.1604068780227552],
                    @[@62, @1, @1.0746279232688645],
                    @[@63, @1, @1.0754057449962198],
                    @[@64, @1, @1.1702610340340533],
                    @[@65, @1, @1.2349098415583113],
                    @[@66, @1, @1.2093153730345152],
                    @[@67, @1, @1.2543779363658636],
                    @[@68, @1, @1.4135547472277685],
                    @[@69, @1, @1.5783677860160275],
                    @[@70, @1, @1.7359751609371363],
                    @[@71, @1, @1.7582883942857246],
                    @[@72, @1, @1.7650969379430927],
                    @[@73, @1, @1.7479145926636213],
                    @[@74, @1, @1.7983586183475304],
                    @[@75, @1, @1.7931923051109682],
                    @[@76, @1, @1.6308037949287144],
                    @[@77, @1, @1.7066358578186618],
                    @[@78, @1, @1.8817196162985979],
                    @[@79, @1, @1.863685619892684],
                    @[@80, @1, @1.853435320696573],
                    @[@81, @1, @1.7776763653233678],
                    @[@82, @1, @1.617715191752884],
                    @[@83, @1, @1.400280077394278],
                    @[@84, @1, @1.3179636421168393],
                    @[@85, @1, @1.3637225599827407],
                    @[@86, @1, @1.3153614347540894],
                    @[@87, @1, @1.2495481314221981],
                    @[@88, @1, @1.2480179428211609],
                    @[@89, @1, @1.177418419949976],
                    @[@90, @1, @1.1119777328122722],
                    @[@91, @1, @1.099620051649959],
                    @[@92, @1, @1.1256576158355844],
                    @[@93, @1, @1.1166293940077126],
                    @[@94, @1, @1.0535112420757389],
                    @[@95, @1, @1.0105586087359117],
                    @[@96, @1, @1.0008251237434218],
                    @[@97, @1, @1.0000244548712798],
                    @[@98, @1, @1.0000002697823016],
                    @[@99, @1, @1.0000000010997019],
                    @[@100, NSNull.new, NSNull.new],
                    @[@101, NSNull.new, NSNull.new],
                    @[@102, NSNull.new, NSNull.new],
                    @[@103, NSNull.new, NSNull.new],
                    @[@104, NSNull.new, NSNull.new],
                    @[@105, NSNull.new, NSNull.new],
                    @[@106, NSNull.new, NSNull.new],
                    @[@107, NSNull.new, NSNull.new],
                    @[@108, NSNull.new, NSNull.new],
                    @[@109, NSNull.new, NSNull.new],
                    @[@110, NSNull.new, NSNull.new],
                    @[@111, NSNull.new, NSNull.new],
                    @[@112, NSNull.new, NSNull.new],
                    @[@113, NSNull.new, NSNull.new],
                    @[@114, NSNull.new, NSNull.new],
                    @[@115, NSNull.new, NSNull.new],
                    @[@116, NSNull.new, NSNull.new],
                    @[@117, NSNull.new, NSNull.new],
                    @[@118, NSNull.new, NSNull.new],
                    @[@119, NSNull.new, NSNull.new],
                    @[@120, NSNull.new, NSNull.new],
                    @[@121, NSNull.new, NSNull.new],
                    @[@122, NSNull.new, NSNull.new],
                    @[@123, NSNull.new, NSNull.new]
                    ])
                .nameSet(@"badminton")
                .zIndexSet(@6),
            AASeriesElement.new
                .dataSet(@[
                    @[@44, NSNull.new, NSNull.new],
                    @[@45, NSNull.new, NSNull.new],
                    @[@46, NSNull.new, NSNull.new],
                    @[@47, NSNull.new, NSNull.new],
                    @[@48, NSNull.new, NSNull.new],
                    @[@49, NSNull.new, NSNull.new],
                    @[@50, NSNull.new, NSNull.new],
                    @[@51, NSNull.new, NSNull.new],
                    @[@52, NSNull.new, NSNull.new],
                    @[@53, NSNull.new, NSNull.new],
                    @[@54, @2, @2.0000000015064177],
                    @[@55, @2, @2.0000003686092764],
                    @[@56, @2, @2.0000331818009194],
                    @[@57, @2, @2.001098989696595],
                    @[@58, @2, @2.0134027813239213],
                    @[@59, @2, @2.0605423301236336],
                    @[@60, @2, @2.1056213640990755],
                    @[@61, @2, @2.0905718812274268],
                    @[@62, @2, @2.070650521390109],
                    @[@63, @2, @2.075044100392073],
                    @[@64, @2, @2.123450723423697],
                    @[@65, @2, @2.1672798266021647],
                    @[@66, @2, @2.160722772996426],
                    @[@67, @2, @2.1695474823093206],
                    @[@68, @2, @2.231323154217013],
                    @[@69, @2, @2.3312138714403203],
                    @[@70, @2, @2.4019467536563615],
                    @[@71, @2, @2.3635732031070273],
                    @[@72, @2, @2.319756195296802],
                    @[@73, @2, @2.4176732612064478],
                    @[@74, @2, @2.732057243688784],
                    @[@75, @2, @2.9248404467054083],
                    @[@76, @2, @2.8372580765671547],
                    @[@77, @2, @2.909375180515294],
                    @[@78, @2, @3.094986934143379],
                    @[@79, @2, @3.113789080710758],
                    @[@80, @2, @2.9277651250274737],
                    @[@81, @2, @2.6243490669377656],
                    @[@82, @2, @2.5299512051292656],
                    @[@83, @2, @2.5542650090399857],
                    @[@84, @2, @2.5809099003264553],
                    @[@85, @2, @2.5736061012262272],
                    @[@86, @2, @2.422970639841939],
                    @[@87, @2, @2.3308883806916527],
                    @[@88, @2, @2.2867345118486684],
                    @[@89, @2, @2.1969461573642644],
                    @[@90, @2, @2.13285875595138],
                    @[@91, @2, @2.108472162485252],
                    @[@92, @2, @2.133987992496036],
                    @[@93, @2, @2.18617256500954],
                    @[@94, @2, @2.1467206331057],
                    @[@95, @2, @2.0806383892686386],
                    @[@96, @2, @2.064506829062374],
                    @[@97, @2, @2.0611415036376854],
                    @[@98, @2, @2.0628755786008703],
                    @[@99, @2, @2.0610917335714047],
                    @[@100, @2, @2.062858435920272],
                    @[@101, @2, @2.0605423286172178],
                    @[@102, @2, @2.0561653408945793],
                    @[@103, @2, @2.0305459578090574],
                    @[@104, @2, @2.0067096862993603],
                    @[@105, @2, @2.0005495870008994],
                    @[@106, @2, @2.000016591277064],
                    @[@107, @2, @2.0000001843052044],
                    @[@108, @2, @2.000000000753209],
                    @[@109, NSNull.new, NSNull.new],
                    @[@110, NSNull.new, NSNull.new],
                    @[@111, NSNull.new, NSNull.new],
                    @[@112, NSNull.new, NSNull.new],
                    @[@113, NSNull.new, NSNull.new],
                    @[@114, NSNull.new, NSNull.new],
                    @[@115, NSNull.new, NSNull.new],
                    @[@116, NSNull.new, NSNull.new],
                    @[@117, NSNull.new, NSNull.new],
                    @[@118, NSNull.new, NSNull.new],
                    @[@119, NSNull.new, NSNull.new],
                    @[@120, NSNull.new, NSNull.new],
                    @[@121, NSNull.new, NSNull.new],
                    @[@122, NSNull.new, NSNull.new],
                    @[@123, NSNull.new, NSNull.new]
                    ])
                .nameSet(@"fencing")
                .zIndexSet(@5),
            AASeriesElement.new
                .dataSet(@[
                    @[@44, NSNull.new, NSNull.new],
                    @[@45, NSNull.new, NSNull.new],
                    @[@46, NSNull.new, NSNull.new],
                    @[@47, @3, @3.000000000280427],
                    @[@48, @3, @3.0000000686203534],
                    @[@49, @3, @3.0000061784622027],
                    @[@50, @3, @3.0002049585567243],
                    @[@51, @3, @3.002528951440051],
                    @[@52, @3, @3.0123951606918817],
                    @[@53, @3, @3.0333640652067952],
                    @[@54, @3, @3.0781751571523386],
                    @[@55, @3, @3.112968214565621],
                    @[@56, @3, @3.067211824408929],
                    @[@57, @3, @3.0149575213525335],
                    @[@58, @3, @3.0012273497165145],
                    @[@59, @3, @3.0000370609583293],
                    @[@60, @3, @3.000000411707364],
                    @[@61, @3, @3.000000001682974],
                    @[@62, @3, @3.000000000283383],
                    @[@63, @3, @3.0000000689096367],
                    @[@64, @3, @3.0000062529744445],
                    @[@65, @3, @3.0002125799642183],
                    @[@66, @3, @3.002864108030299],
                    @[@67, @3, @3.0192641425029048],
                    @[@68, @3, @3.0996394232489033],
                    @[@69, @3, @3.3675118862089573],
                    @[@70, @3, @3.7072370572131925],
                    @[@71, @3, @3.8037935214394993],
                    @[@72, @3, @3.7838425049532294],
                    @[@73, @3, @3.6542243690187304],
                    @[@74, @3, @3.4173256207641782],
                    @[@75, @3, @3.281979922456228],
                    @[@76, @3, @3.1993204893170266],
                    @[@77, @3, @3.1139521585977463],
                    @[@78, @3, @3.0600587907936356],
                    @[@79, @3, @3.0532320430966093],
                    @[@80, @3, @3.0722461037388387],
                    @[@81, @3, @3.0687381477786335],
                    @[@82, @3, @3.0658698923849754],
                    @[@83, @3, @3.092750203716751],
                    @[@84, @3, @3.1635448003423985],
                    @[@85, @3, @3.2708663256339325],
                    @[@86, @3, @3.324127519891395],
                    @[@87, @3, @3.310217510202677],
                    @[@88, @3, @3.338950342484914],
                    @[@89, @3, @3.475139725128321],
                    @[@90, @3, @3.626039318487685],
                    @[@91, @3, @3.6438205456428117],
                    @[@92, @3, @3.6475997993933644],
                    @[@93, @3, @3.6852373159797],
                    @[@94, @3, @3.7359224564704236],
                    @[@95, @3, @3.77040793064133],
                    @[@96, @3, @3.682542289099339],
                    @[@97, @3, @3.5523520159021578],
                    @[@98, @3, @3.425424079487115],
                    @[@99, @3, @3.363857703599389],
                    @[@100, @3, @3.395980067062387],
                    @[@101, @3, @3.3324797949612264],
                    @[@102, @3, @3.2395870480508404],
                    @[@103, @3, @3.1903426293395603],
                    @[@104, @3, @3.1704032635740544],
                    @[@105, @3, @3.1411201608729438],
                    @[@106, @3, @3.089866796917827],
                    @[@107, @3, @3.063130146735107],
                    @[@108, @3, @3.056312095202901],
                    @[@109, @3, @3.0473929384183984],
                    @[@110, @3, @3.042020222015814],
                    @[@111, @3, @3.022751099406809],
                    @[@112, @3, @3.004996203983532],
                    @[@113, @3, @3.000409231216059],
                    @[@114, @3, @3.000012354120574],
                    @[@115, @3, @3.000000137236491],
                    @[@116, @3, @3.0000000005608514],
                    @[@117, NSNull.new, NSNull.new],
                    @[@118, NSNull.new, NSNull.new],
                    @[@119, NSNull.new, NSNull.new],
                    @[@120, NSNull.new, NSNull.new],
                    @[@121, NSNull.new, NSNull.new],
                    @[@122, NSNull.new, NSNull.new],
                    @[@123, NSNull.new, NSNull.new]
                    ])
                .nameSet(@"rowing")
                .zIndexSet(@4),
            AASeriesElement.new
                .dataSet(@[
                    @[@44, NSNull.new, NSNull.new],
                    @[@45, NSNull.new, NSNull.new],
                    @[@46, NSNull.new, NSNull.new],
                    @[@47, NSNull.new, NSNull.new],
                    @[@48, NSNull.new, NSNull.new],
                    @[@49, NSNull.new, NSNull.new],
                    @[@50, NSNull.new, NSNull.new],
                    @[@51, NSNull.new, NSNull.new],
                    @[@52, NSNull.new, NSNull.new],
                    @[@53, NSNull.new, NSNull.new],
                    @[@54, NSNull.new, NSNull.new],
                    @[@55, NSNull.new, NSNull.new],
                    @[@56, NSNull.new, NSNull.new],
                    @[@57, NSNull.new, NSNull.new],
                    @[@58, NSNull.new, NSNull.new],
                    @[@59, NSNull.new, NSNull.new],
                    @[@60, NSNull.new, NSNull.new],
                    @[@61, NSNull.new, NSNull.new],
                    @[@62, NSNull.new, NSNull.new],
                    @[@63, NSNull.new, NSNull.new],
                    @[@64, NSNull.new, NSNull.new],
                    @[@65, NSNull.new, NSNull.new],
                    @[@66, @4, @4.000000000498023],
                    @[@67, @4, @4.000000121862256],
                    @[@68, @4, @4.000010969692134],
                    @[@69, @4, @4.0003632672593215],
                    @[@70, @4, @4.004425732785965],
                    @[@71, @4, @4.019855607319056],
                    @[@72, @4, @4.033427207891265],
                    @[@73, @4, @4.028728767547955],
                    @[@74, @4, @4.045568071595839],
                    @[@75, @4, @4.0842146775569965],
                    @[@76, @4, @4.12864532744282],
                    @[@77, @4, @4.189987221641792],
                    @[@78, @4, @4.207322532049918],
                    @[@79, @4, @4.224172561571144],
                    @[@80, @4, @4.241126746146999],
                    @[@81, @4, @4.241475939300969],
                    @[@82, @4, @4.284512419486368],
                    @[@83, @4, @4.258338247077153],
                    @[@84, @4, @4.221845423565861],
                    @[@85, @4, @4.286991432226439],
                    @[@86, @4, @4.377631492688112],
                    @[@87, @4, @4.483170071370884],
                    @[@88, @4, @4.567178150557284],
                    @[@89, @4, @4.545321691841866],
                    @[@90, @4, @4.506963910824586],
                    @[@91, @4, @4.4506624468075335],
                    @[@92, @4, @4.525276193748056],
                    @[@93, @4, @4.635053285801717],
                    @[@94, @4, @4.613364138964222],
                    @[@95, @4, @4.517529824923478],
                    @[@96, @4, @4.373219209291548],
                    @[@97, @4, @4.374222191549226],
                    @[@98, @4, @4.474967479691312],
                    @[@99, @4, @4.573606764758763],
                    @[@100, @4, @4.602396073452112],
                    @[@101, @4, @4.402075307169123],
                    @[@102, @4, @4.314892657034758],
                    @[@103, @4, @4.425917135162799],
                    @[@104, @4, @4.5454319569369686],
                    @[@105, @4, @4.562594608672595],
                    @[@106, @4, @4.407609937316872],
                    @[@107, @4, @4.247471331784121],
                    @[@108, @4, @4.226569687047266],
                    @[@109, @4, @4.3369896477734],
                    @[@110, @4, @4.420816640482869],
                    @[@111, @4, @4.338000964845673],
                    @[@112, @4, @4.220623709860507],
                    @[@113, @4, @4.13558113486771],
                    @[@114, @4, @4.103772592031548],
                    @[@115, @4, @4.074206887760041],
                    @[@116, @4, @4.033154260091078],
                    @[@117, @4, @4.024986175981005],
                    @[@118, @4, @4.033085394556291],
                    @[@119, @4, @4.019844879362335],
                    @[@120, @4, @4.004425611916761],
                    @[@121, @4, @4.000363266762794],
                    @[@122, @4, @4.000010969691386],
                    @[@123, @4, @4.000000121862255]
                    ])
                .nameSet(@"handball")
                .zIndexSet(@3),
            AASeriesElement.new
                .dataSet(@[
                    @[@44, NSNull.new, NSNull.new],
                    @[@45, NSNull.new, NSNull.new],
                    @[@46, @5, @5.000000000294946],
                    @[@47, @5, @5.000000072171294],
                    @[@48, @5, @5.000006496907847],
                    @[@49, @5, @5.000215210443718],
                    @[@50, @5, @5.00262741761326],
                    @[@51, @5, @5.011961362712401],
                    @[@52, @5, @5.021993694136598],
                    @[@53, @5, @5.023721013104344],
                    @[@54, @5, @5.025090439553514],
                    @[@55, @5, @5.030690386021004],
                    @[@56, @5, @5.067144543507696],
                    @[@57, @5, @5.154071269823003],
                    @[@58, @5, @5.235990110114159],
                    @[@59, @5, @5.257683821121304],
                    @[@60, @5, @5.2908942062236415],
                    @[@61, @5, @5.351341978795782],
                    @[@62, @5, @5.419247304545581],
                    @[@63, @5, @5.478074195414168],
                    @[@64, @5, @5.5739878976975525],
                    @[@65, @5, @5.643418999962501],
                    @[@66, @5, @5.612014797123593],
                    @[@67, @5, @5.663865826672245],
                    @[@68, @5, @5.786928206743586],
                    @[@69, @5, @5.880527026957551],
                    @[@70, @5, @5.837747720478012],
                    @[@71, @5, @5.568817104910722],
                    @[@72, @5, @5.438382078682881],
                    @[@73, @5, @5.459343582924229],
                    @[@74, @5, @5.46611289089268],
                    @[@75, @5, @5.491783617887879],
                    @[@76, @5, @5.488803785458897],
                    @[@77, @5, @5.500071122754068],
                    @[@78, @5, @5.467475175410382],
                    @[@79, @5, @5.3908146354259685],
                    @[@80, @5, @5.3513139482780385],
                    @[@81, @5, @5.348122118462926],
                    @[@82, @5, @5.329503355246251],
                    @[@83, @5, @5.254324441324518],
                    @[@84, @5, @5.207448048545224],
                    @[@85, @5, @5.237953842165369],
                    @[@86, @5, @5.217872259996754],
                    @[@87, @5, @5.167001355679728],
                    @[@88, @5, @5.142610180491234],
                    @[@89, @5, @5.179583761177635],
                    @[@90, @5, @5.210012547709085],
                    @[@91, @5, @5.14540281268566],
                    @[@92, @5, @5.110192054560989],
                    @[@93, @5, @5.108584821585347],
                    @[@94, @5, @5.081234345889062],
                    @[@95, @5, @5.07576016595127],
                    @[@96, @5, @5.074850760844008],
                    @[@97, @5, @5.048341543946716],
                    @[@98, @5, @5.020039479607401],
                    @[@99, @5, @5.014810343331531],
                    @[@100, @5, @5.0195944059582756],
                    @[@101, @5, @5.011752793220181],
                    @[@102, @5, @5.002620993466152],
                    @[@103, @5, @5.000215138568257],
                    @[@104, @5, @5.000006496613345],
                    @[@105, @5, @5.000000072170851],
                    @[@106, @5, @5.000000000294945],
                    @[@107, NSNull.new, NSNull.new],
                    @[@108, NSNull.new, NSNull.new],
                    @[@109, NSNull.new, NSNull.new],
                    @[@110, NSNull.new, NSNull.new],
                    @[@111, NSNull.new, NSNull.new],
                    @[@112, NSNull.new, NSNull.new],
                    @[@113, NSNull.new, NSNull.new],
                    @[@114, NSNull.new, NSNull.new],
                    @[@115, NSNull.new, NSNull.new],
                    @[@116, NSNull.new, NSNull.new],
                    @[@117, NSNull.new, NSNull.new],
                    @[@118, NSNull.new, NSNull.new],
                    @[@119, NSNull.new, NSNull.new],
                    @[@120, NSNull.new, NSNull.new],
                    @[@121, NSNull.new, NSNull.new],
                    @[@122, NSNull.new, NSNull.new],
                    @[@123, NSNull.new, NSNull.new]
                    ])
                .nameSet(@"cycling")
                .zIndexSet(@2),
            AASeriesElement.new
                .dataSet(@[
                    @[@44, @6, @6.000000000829776],
                    @[@45, @6, @6.0000002035655005],
                    @[@46, @6, @6.0000184539677806],
                    @[@47, @6, @6.0006229980142045],
                    @[@48, @6, @6.008003249135336],
                    @[@49, @6, @6.041567711522384],
                    @[@50, @6, @6.102178004620184],
                    @[@51, @6, @6.1553123824259695],
                    @[@52, @6, @6.1749298896071245],
                    @[@53, @6, @6.219026304294773],
                    @[@54, @6, @6.401709652283469],
                    @[@55, @6, @6.564896677301729],
                    @[@56, @6, @6.579729017018052],
                    @[@57, @6, @6.577116944624911],
                    @[@58, @6, @6.581753478402179],
                    @[@59, @6, @6.6774365923091175],
                    @[@60, @6, @6.787148802029359],
                    @[@61, @6, @6.803457909543387],
                    @[@62, @6, @6.989488836462547],
                    @[@63, @6, @7.159677486551647],
                    @[@64, @6, @7.230267675375782],
                    @[@65, @6, @7.157828717174454],
                    @[@66, @6, @6.876283332623285],
                    @[@67, @6, @6.650146027319757],
                    @[@68, @6, @6.530841248817718],
                    @[@69, @6, @6.404919941333811],
                    @[@70, @6, @6.382931842288819],
                    @[@71, @6, @6.46702007379208],
                    @[@72, @6, @6.427982641665984],
                    @[@73, @6, @6.2360529270774325],
                    @[@74, @6, @6.127304373315464],
                    @[@75, @6, @6.099063439490831],
                    @[@76, @6, @6.088171492564679],
                    @[@77, @6, @6.128379249887726],
                    @[@78, @6, @6.143025387652856],
                    @[@79, @6, @6.08073527714395],
                    @[@80, @6, @6.048325363466302],
                    @[@81, @6, @6.055628156391285],
                    @[@82, @6, @6.033032709777181],
                    @[@83, @6, @6.0073628108220145],
                    @[@84, @6, @6.000604344623569],
                    @[@85, @6, @6.000018249578733],
                    @[@86, @6, @6.000000202734481],
                    @[@87, @6, @6.000000000828529],
                    @[@88, NSNull.new, NSNull.new],
                    @[@89, NSNull.new, NSNull.new],
                    @[@90, NSNull.new, NSNull.new],
                    @[@91, NSNull.new, NSNull.new],
                    @[@92, NSNull.new, NSNull.new],
                    @[@93, NSNull.new, NSNull.new],
                    @[@94, NSNull.new, NSNull.new],
                    @[@95, NSNull.new, NSNull.new],
                    @[@96, NSNull.new, NSNull.new],
                    @[@97, NSNull.new, NSNull.new],
                    @[@98, NSNull.new, NSNull.new],
                    @[@99, NSNull.new, NSNull.new],
                    @[@100, NSNull.new, NSNull.new],
                    @[@101, NSNull.new, NSNull.new],
                    @[@102, NSNull.new, NSNull.new],
                    @[@103, NSNull.new, NSNull.new],
                    @[@104, NSNull.new, NSNull.new],
                    @[@105, NSNull.new, NSNull.new],
                    @[@106, NSNull.new, NSNull.new],
                    @[@107, NSNull.new, NSNull.new],
                    @[@108, NSNull.new, NSNull.new],
                    @[@109, NSNull.new, NSNull.new],
                    @[@110, NSNull.new, NSNull.new],
                    @[@111, NSNull.new, NSNull.new],
                    @[@112, NSNull.new, NSNull.new],
                    @[@113, NSNull.new, NSNull.new],
                    @[@114, NSNull.new, NSNull.new],
                    @[@115, NSNull.new, NSNull.new],
                    @[@116, NSNull.new, NSNull.new],
                    @[@117, NSNull.new, NSNull.new],
                    @[@118, NSNull.new, NSNull.new],
                    @[@119, NSNull.new, NSNull.new],
                    @[@120, NSNull.new, NSNull.new],
                    @[@121, NSNull.new, NSNull.new],
                    @[@122, NSNull.new, NSNull.new],
                    @[@123, NSNull.new, NSNull.new]
                    ])
                .nameSet(@"gymnastics")
                .zIndexSet(@1)
        ]);
}

@end
