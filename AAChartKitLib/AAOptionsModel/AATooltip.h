//
//  AATooltip.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
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

@interface AATooltip : NSObject
AAPropStatementAndFuncStatement(assign, AATooltip, BOOL,       enabled);
AAPropStatementAndFuncStatement(copy,   AATooltip, NSString *, headerFormat);
AAPropStatementAndFuncStatement(copy,   AATooltip, NSString *, pointFormat);
AAPropStatementAndFuncStatement(copy,   AATooltip, NSString *, footerFormat);
AAPropStatementAndFuncStatement(assign, AATooltip, BOOL,       shared);
AAPropStatementAndFuncStatement(assign, AATooltip, BOOL,       crosshairs);

//AAPropStatementAndFuncStatement(assign, AATooltip, BOOL, useHTML);
AAPropStatementAndFuncStatement(copy,   AATooltip, NSString *, valueSuffix);
//AAPropStatementAndFuncStatement(assign, AATooltip, BOOL,       followTouchMove);//在触摸设备上，tooltip.followTouchMove选项为true（默认）时，平移需要两根手指。若要允许用一根手指平移，请将followTouchMove设置为false。




@end
