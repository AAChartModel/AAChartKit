//
//  AAColumnAndBarAndSoOnOptions.h
//  AAChartKit
//
//  Created by An An on 17/1/9.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

/*
 
 * -------------------------------------------------------------------------------
 *
 * ❀❀❀   WARM TIPS!!!   ❀❀❀
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import <Foundation/Foundation.h>
#import "AAOptions.h"
#import "AAChart.h"
#import "AAAnimation.h"
#import "AATitle.h"
#import "AASubtitle.h"
#import "AAXAxis.h"
#import "AAYAxis.h"
#import "AALabels.h"
#import "AATooltip.h"
#import "AAPlotOptions.h"
#import "AAColumn.h"
#import "AABar.h"
#import "AAArea.h"
#import "AAAreaspline.h"
#import "AALine.h"
#import "AASpline.h"
#import "AAPie.h"
#import "AAPlotLinesElement.h"
#import "AALegend.h"
#import "AADataLabels.h"
#import "AAStyle.h"
#import "AASeries.h"
#import "AAMarker.h"
#import "AAChartModel.h"
#import "AAOptions3d.h"

@interface AAOptionsConstructor : NSObject

 
/**
 Configure the chart content and style

 @param chartModel The instance object of chart model
 @return The instance object of chart options
 */
+ (AAOptions *)configureChartOptionsWithAAChartModel:(AAChartModel *)chartModel;


@end
