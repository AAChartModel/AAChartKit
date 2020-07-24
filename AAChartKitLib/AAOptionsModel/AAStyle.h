//
//  AAStyle.h
//  AAChartKit
//
//  Created by An An on 17/1/6.
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
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */


#import <Foundation/Foundation.h>

@interface AAStyle : NSObject

//Styles for the label. 默认是：{"color": "contrast", "fontSize": "11px", "fontWeight": "bold", "textOutline": "1px 1px contrast" }.
AAPropStatementAndPropSetFuncStatement(copy, AAStyle, NSString *, color) //设置文字的颜色,可修改为 #ff00ff 任意的这种十六进制字符串
AAPropStatementAndPropSetFuncStatement(copy, AAStyle, NSString *, fontSize) //文字大小
AAPropStatementAndPropSetFuncStatement(copy, AAStyle, NSString *, fontWeight) //可选的值有 bold, regular和 thin 三种,分别对应的是加粗字体,常规字体和纤细字体
AAPropStatementAndPropSetFuncStatement(copy, AAStyle, NSString *, textOutline) //文字轮廓描边

+ (AAStyle *)styleWithColor:(NSString *)color;

+ (AAStyle *)styleWithColor:(NSString *)color
                   fontSize:(float)fontSize;

+ (AAStyle *)styleWithColor:(NSString *)color
                   fontSize:(float)fontSize
                 fontWeight:(NSString *)fontWeight;

+ (AAStyle *)styleWithColor:(NSString *)color
                   fontSize:(float)fontSize
                 fontWeight:(NSString *)fontWeight
                textOutline:(NSString *)textOutline;

@end

