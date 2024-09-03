//
//  JSFunctionForAAChartEventsVC.h
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

#import <UIKit/UIKit.h>
#import "AABaseChartVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSFunctionForAAChartEventsComposer : AABaseChartVC

+ (AAOptions *)setCrosshairAndTooltipToTheDefaultPositionAfterLoadingChart; //图表加载完成后,自动设置默认的十字准星和浮动提示框的位置
+ (AAOptions *)generalDrawingChart; //自由绘图
+ (AAOptions *)advancedTimeLineChart; //高级时间线图
+ (AAOptions *)configureBlinkMarkerChart; //配置闪烁的标记点
+ (AAOptions *)configureSpecialStyleMarkerOfSingleDataElementChartWithBlinkEffect; //配置单个数据元素的特殊样式标记点即闪烁特效
+ (AAOptions *)configureScatterChartWithBlinkEffect; //配置散点图的闪烁特效
+ (AAOptions *)automaticallyHideTooltipAfterItIsShown; //图表加载完成后,自动隐藏浮动提示框
+ (AAOptions *)dynamicHeightGridLineAreaChart; //动态高度网格线的区域填充图
+ (AAOptions *)customizeYAxisPlotLinesLabelBeSpecialStyle; //自定义 Y 轴轴线上面的标签文字特殊样式
+ (AAOptions *)configureECGStyleChart; //配置心电图样式的图表

@end

NS_ASSUME_NONNULL_END
