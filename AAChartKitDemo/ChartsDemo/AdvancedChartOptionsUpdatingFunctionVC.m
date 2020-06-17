//
//  AdvancedChartOptionsUpdatingFunctionVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2020/6/6.
//  Copyright © 2020 Danny boy. All rights reserved.
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
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AdvancedChartOptionsUpdatingFunctionVC.h"
#import "AAChartKit.h"

@interface AdvancedChartOptionsUpdatingFunctionVC ()

@end

@implementation AdvancedChartOptionsUpdatingFunctionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
