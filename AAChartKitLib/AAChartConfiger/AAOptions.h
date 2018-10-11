//
//  AAOptions.h
//  AAChartKit
//
//  Created by An An on 17/1/4.
//  Copyright © 2017年 An An. All rights reserved.
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
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */


#import <Foundation/Foundation.h>

#import "AAChart.h"
#import "AAAnimation.h"
#import "AATitle.h"
#import "AASubtitle.h"
#import "AAXAxis.h"
#import "AAYAxis.h"
#import "AACrosshair.h"
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
#import "AALegend.h"
#import "AADataLabels.h"
#import "AAStyle.h"
#import "AASeries.h"
#import "AAMarker.h"
#import "AAOptions3d.h"

@interface AAOptions : NSObject

AAPropStatementAndPropSetFuncStatement(strong, AAOptions, AAChart       *, chart) 
AAPropStatementAndPropSetFuncStatement(strong, AAOptions, AATitle       *, title) 
AAPropStatementAndPropSetFuncStatement(strong, AAOptions, AASubtitle    *, subtitle) 
AAPropStatementAndPropSetFuncStatement(strong, AAOptions, AAXAxis       *, xAxis) 
AAPropStatementAndPropSetFuncStatement(strong, AAOptions, AAYAxis       *, yAxis) 
AAPropStatementAndPropSetFuncStatement(strong, AAOptions, AATooltip     *, tooltip) 
AAPropStatementAndPropSetFuncStatement(strong, AAOptions, AAPlotOptions *, plotOptions) 
AAPropStatementAndPropSetFuncStatement(strong, AAOptions, NSArray       *, series) 
AAPropStatementAndPropSetFuncStatement(strong, AAOptions, AALegend      *, legend) 
AAPropStatementAndPropSetFuncStatement(strong, AAOptions, NSArray       *, colors) 
AAPropStatementAndPropSetFuncStatement(assign, AAOptions, BOOL,            gradientColorEnabled) 
AAPropStatementAndPropSetFuncStatement(copy,   AAOptions, NSString      *, zoomResetButtonText)  //String to display in 'zoom reset button"

@end



#import "AAChartModel.h"

@interface AAOptionsConstructor : NSObject


/**
 Configure the chart content and style
 
 @param chartModel The instance object of chart model
 @return The instance object of chart options
 */
+ (AAOptions *)configureChartOptionsWithAAChartModel:(AAChartModel *)chartModel;


@end
