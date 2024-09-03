//
//  JSFunctionForAAChartEventsComposer2.h
//  AAChartKitDemo
//
//  Created by AnAn on 2024/1/26.
//  Copyright © 2024 An An. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AAOptions;

NS_ASSUME_NONNULL_BEGIN

@interface JSFunctionForAAChartEventsComposer2 : NSObject

+ (AAOptions *)configureTheSizeOfTheSliceOfDonutAndPieChart;
+ (AAOptions *)configurePlotBackgroundClickEvent;
+ (AAOptions *)disableHoverEventEffect;
+ (AAOptions *)addClickEventToXAxisLabelAndAccessData;
+ (AAOptions *)addClickEventToHighlightXAxisLabel;

+ (AAOptions *)addClickEventToXAxisLabelAndAccessDataAndHighlightXAxisLabel;
+ (AAOptions *)defaultSelectedAPointForLineChart;
+ (AAOptions *)configureBlinkMarkerChart;
+ (AAOptions *)toggleDataLabelsOnTouch;
+ (AAOptions *)autoCrosshairAndTooltip;

@end

NS_ASSUME_NONNULL_END
