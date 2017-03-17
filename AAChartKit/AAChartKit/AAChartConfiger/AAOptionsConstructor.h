//
//  AAColumnAndBarAndSoOnOptions.h
//  AAChartKit
//
//  Created by An An on 17/1/9.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AAOptions.h"
#import "AAChart.h"
#import "AATitle.h"
#import "AASubtitle.h"
#import "AAXAxis.h"
#import "AAYAxis.h"
#import "AALabels.h"
#import "AAToolTip.h"
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
 配置柱状图等图表模型内容

 @param chartModel 图表模型
 @return 图表模型 Options 选择项
 */
+(AAOptions *)configColumnAndBarAndSoONChartOptionsWithAAChartModel:(AAChartModel *)chartModel;


@end
