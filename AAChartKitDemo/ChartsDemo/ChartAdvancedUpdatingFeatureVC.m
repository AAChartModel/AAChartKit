//
//  AdvancedChartOptionsUpdatingFunctionVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2020/6/6.
//  Copyright © 2020 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

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

#import "ChartAdvancedUpdatingFeatureVC.h"

@interface ChartAdvancedUpdatingFeatureVC ()

@end

@implementation ChartAdvancedUpdatingFeatureVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)customSegmentedControlCellValueBeChanged:(UISegmentedControl *)segmentedControl {
    id options;
    NSInteger selectedSegmentIndex = segmentedControl.selectedSegmentIndex;
    switch (segmentedControl.tag) {
        case 0: {
            NSArray *stackingArr = @[
                AAChartStackingTypeFalse,
                AAChartStackingTypeNormal,
                AAChartStackingTypePercent
            ];
            AAChartStackingType stackingType = stackingArr[selectedSegmentIndex];
            AAPlotOptions *aaPlotOptions = AAPlotOptions.new
            .seriesSet(AASeries.new
                       .stackingSet(stackingType));
            options = aaPlotOptions;
        }
            break;
            
        case 1: {
            if (self.chartType == 0 || self.chartType == 1 ) {
                NSArray *borderRadiusArr = @[
                    @1,
                    @10,
                    @100
                ];
                NSNumber *borderRadius = borderRadiusArr[selectedSegmentIndex];
                AAPlotOptions *aaPlotOptions;
                if (self.chartType == 0) {
                    aaPlotOptions = AAPlotOptions.new
                    .columnSet(AAColumn.new
                               .borderRadiusSet(borderRadius));
                } else {
                    aaPlotOptions = AAPlotOptions.new
                    .barSet(AABar.new
                            .borderRadiusSet(borderRadius));
                }
                options = aaPlotOptions;
                
            } else {
                NSArray *symbolArr = @[
                    AAChartSymbolTypeCircle,
                    AAChartSymbolTypeSquare,
                    AAChartSymbolTypeDiamond,
                    AAChartSymbolTypeTriangle,
                    AAChartSymbolTypeTriangle_down
                ];
                AAChartSymbolType markerSymbol = symbolArr[selectedSegmentIndex];
                AAPlotOptions *aaPlotOptions = AAPlotOptions.new
                .seriesSet(AASeries.new
                           .markerSet(AAMarker.new
                                      .symbolSet(markerSymbol))
                           );
                options = aaPlotOptions;
            }
        }
            break;
            
        default:
            break;
    }
    [self.aaChartView aa_updateChartWithOptions:options];
}

- (void)switchViewClicked:(UISwitch *)switchView {
    id options;
    BOOL isOn = switchView.isOn;
    switch (switchView.tag) {
        case 0: {
            AAXAxis *aaXAxis = AAXAxis.new
            .reversedSet(isOn);
            options = aaXAxis;
//            AAChart *chart = AAChart.new;
//            chart.backgroundColor = (id)AAGradientColor.springGreensColor;
//            options = chart;
        }
            break;
        case 1: {
            AAYAxis *aaYAxis = AAYAxis.new
            .reversedSet(isOn);
            options = aaYAxis;
        }
            break;
        case 2: {
            if (self.aaChartModel.chartType == AAChartTypeBar) {
                NSLog(@"⚠️⚠️⚠️inverted is useless for Bar Chart");
            }
            self.aaChartModel.inverted = isOn;
            AAChart *aaChart = AAChart.new
            .invertedSet(isOn)
            .polarSet(self.aaChartModel.polar);
            options = aaChart;
        }
            break;
        case 3: {
            self.aaChartModel.polar = isOn;
            AAChart *aaChart = AAChart.new
            .polarSet(isOn)
            .invertedSet(self.aaChartModel.inverted);
            options = aaChart;
            
            if (self.aaChartModel.chartType == AAChartTypeColumn) {
                if (self.aaChartModel.polar == true) {
                    options = AAOptions.new
                    .chartSet(aaChart)
                    .plotOptionsSet(AAPlotOptions.new
                                    .columnSet(AAColumn.new
                                               .pointPaddingSet(@0)
                                               .groupPaddingSet(@0.005)));
                } else {
                    options = AAOptions.new
                    .chartSet(aaChart)
                    .plotOptionsSet(AAPlotOptions.new
                                    .columnSet(AAColumn.new
                                               .pointPaddingSet(@0.1)
                                               .groupPaddingSet(@0.2)));
                }
            } else if (self.aaChartModel.chartType == AAChartTypeBar) {
                if (self.aaChartModel.chartType == AAChartTypeBar) {
                    if (self.aaChartModel.polar == true) {
                        options = AAOptions.new
                        .chartSet(aaChart)
                        .plotOptionsSet(AAPlotOptions.new
                                        .barSet(AABar.new
                                                .pointPaddingSet(@0)
                                                .groupPaddingSet(@0.005)));
                    } else {
                        options = AAOptions.new
                        .chartSet(aaChart)
                        .plotOptionsSet(AAPlotOptions.new
                                        .barSet(AABar.new
                                                .pointPaddingSet(@0.1)
                                                .groupPaddingSet(@0.2)));
                    }
                }
            }
        }
            break;
        case 4:  {
            AAPlotOptions *aaPlotOptions = AAPlotOptions.new
            .seriesSet(AASeries.new
                       .dataLabelsSet(AADataLabels.new
                                      .enabledSet(isOn)));
            options = aaPlotOptions;
        }
            break;
        case 5: {
            AAMarker *aaMarker = isOn ?
            AAMarker.new
            .enabledSet(false)
            :
            AAMarker.new
            .enabledSet(true)
            .radiusSet( @5);
            
            AAPlotOptions *aaPlotOptions = AAPlotOptions.new
            .seriesSet(AASeries.new
                       .markerSet(aaMarker));
            options = aaPlotOptions;
        }
            break;
        default:
            break;
    }
    
    [self.aaChartView aa_updateChartWithOptions:options];
}

- (void)aa_updateChartWithOptions:(id)options {
    [self.aaChartView aa_updateChartWithOptions:options redraw:false];
}

- (AAOptions *)configureChartThemeOptions {
    return AAOptions.new
    .colorsSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])
    .chartSet(AAChart.new
              .backgroundColorSet(AAColor.blackColor))
    .titleSet(AATitle.new
              .useHTMLSet(true)
              .styleSet(AAStyle.new
                        .colorSet(AAColor.whiteColor)
                        .fontSizeSet(@"20px")))
    .subtitleSet(AASubtitle.new
                 .styleSet(AAStyle.new
                           .colorSet(AAColor.whiteColor)
                           .fontSizeSet(@"14px")))
    .yAxisSet(AAYAxis.new
              .titleSet(AAAxisTitle.new
                        .styleSet(AAStyle.new
                        .colorSet(AAColor.whiteColor)
                        .fontSizeSet(@"20px")))
              .labelsSet(AALabels.new
                         .styleSet(AAStyle.new
                         .colorSet(AAColor.whiteColor)))
              )
    .xAxisSet(AAXAxis.new
                .labelsSet(AALabels.new
                           .styleSet(AAStyle.new
                           .colorSet(AAColor.whiteColor)
                           .fontSizeSet(@"20px")))
                )
    .legendSet(AALegend.new
               .enabledSet(true)
               .itemStyleSet(AAItemStyle.new
                             .colorSet(AAColor.whiteColor)
                             .fontSizeSet(@"12px")))
    ;
    
//    [self.aaChartView aa_updateChartWithOptions:aaChartThemeOptions redraw:true];
}

@end
