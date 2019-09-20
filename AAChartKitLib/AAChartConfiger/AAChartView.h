//
//  AAChartView.h
//  AAChartKit
//
//  Created by An An on 17/1/16.
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
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "AAOptions.h"

@interface AAMoveOverEventMessageModel : NSObject

@property (nonatomic, copy)   NSString *name;
@property (nonatomic, strong) NSNumber *x;
@property (nonatomic, strong) NSNumber *y;
@property (nonatomic, copy)   NSString *category;
@property (nonatomic, strong) NSDictionary *offset;
@property (nonatomic, assign) NSUInteger index;

@end


@class AAChartView;

@protocol AAChartViewEventDelegate<NSObject>

@optional

/**
 The delegate method of chart view finish loading
 */
- (void)aaChartViewDidFinishLoad:(AAChartView *)aaChartView;

/**
 The delegate method of getting move over event message model

 @param aaChartView The instance object of chart view
 @param message move over event message model
 */
- (void)aaChartView:(AAChartView *)aaChartView moveOverEventWithMessage:(AAMoveOverEventMessageModel *)message;

@end

@interface AAChartView:WKWebView

@property (nonatomic, weak)   id<AAChartViewEventDelegate> delegate;

/**
 Configure the behavior of adjustedContentInset.
 Default is UIScrollViewContentInsetAdjustmentAutomatic.
 */
@property(nonatomic) UIScrollViewContentInsetAdjustmentBehavior contentInsetAdjustmentBehavior API_AVAILABLE(ios(11.0),tvos(11.0));

/**
 Set the chart view can scroll or not
 */
@property (nonatomic, assign) BOOL scrollEnabled;

/**
 Content width of AAChartView
 */
@property (nonatomic, assign) CGFloat  contentWidth;

/**
 Content height of AAChartView
 */
@property (nonatomic, assign) CGFloat  contentHeight;

/**
 Hide chart series content or not
 */
@property (nonatomic, assign) BOOL chartSeriesHidden;

/**
 Set the chart view background color be clear
 */
@property (nonatomic, assign) BOOL isClearBackgroundColor;


//***********************CONFIGURE THE CHART VIEW CONTENT WITH `AACHARTMODEL`***********************//
/**
 Function of drawing chart view
 
 @param chartModel The instance object of chart model
 */
- (void)aa_drawChartWithChartModel:(AAChartModel *)chartModel;

/**
 Function of only refresh the chart data
 
 @param series  Series array of AAChartModel instance object
 */
- (void)aa_onlyRefreshTheChartDataWithChartModelSeries:(NSArray<NSDictionary *> *)series;

/**
 Function of refreshing whole chart view content
 
 @param chartModel The instance object of chart model
 */
- (void)aa_refreshChartWithChartModel:(AAChartModel *)chartModel;


//***********************CONFIGURE THE CHART VIEW CONTENT WITH `AACHARTMODEL`***********************//


//=======================CONFIGURE THE CHART VIEW CONTENT WITH `AAOPTIONS`=======================//
/**
 Function of drawing chart view

 @param options The instance object of chart options
 */
- (void)aa_drawChartWithOptions:(AAOptions *)options;

/**
 Function of only refresh the chart data
 
 @param series Series array of AAOptions instance object
 */
- (void)aa_onlyRefreshTheChartDataWithOptionsSeries:(NSArray<NSDictionary *> *)series;
    
/**
 Function of refreshing whole chart view content

 @param options The instance object of chart options
 */
- (void)aa_refreshChartWithOptions:(AAOptions *)options;

//=======================CONFIGURE THE CHART VIEW CONTENT WITH `AAOPTIONS`=======================//


/**
 An universal chart update function (you can update any chart element) to open, close,
 delete, add, resize, reformat, etc without redrawing chart.
 
 @param options A configuration object for the new chart options as defined in the
 options section of the API
 */
- (void)aa_updateChartWithOptions:(NSObject *)options;

/**
 An universal chart update function (you can update any chart element) to open, close,
 delete, add, resize, reformat, etc.
 
 @param options A configuration object for the new chart options as defined in the
 options section of the API
 @param redraw Whether to redraw after updating the chart.
 */
- (void)aa_updateChartWithOptions:(NSObject *)options redraw:(BOOL)redraw;

- (void)aa_addPointToChartSeriesElementWithElementIndex:(NSUInteger)elementIndex
                                               options:(NSObject *)options;

- (void)aa_addPointToChartSeriesElementWithElementIndex:(NSUInteger)elementIndex
                                               options:(NSObject *)options
                                                 shift:(BOOL)shift;

- (void)aa_addPointToChartSeriesElementWithElementIndex:(NSUInteger)elementIndex
                                               options:(NSObject *)options
                                                redraw:(BOOL)redraw
                                                 shift:(BOOL)shift
                                             animation:(BOOL)animation;

/**
 Show the series element content with index
 
 @param elementIndex element index
 */
- (void)aa_showTheSeriesElementContentWithSeriesElementIndex:(NSInteger)elementIndex;

/**
 Hide the series element content with index
 
 @param elementIndex element index
 */
- (void)aa_hideTheSeriesElementContentWithSeriesElementIndex:(NSInteger)elementIndex;

@end


@interface AAJsonConverter : NSObject

/**
 Convert Object to be Dictionary
 
 @param objc  object instance
 @return NSDictionay
 */
+ (NSDictionary*)getObjectData:(id)objc;

/**
 Get pure options string
 
 @param optionsObject Instance object of AAOptions
 @return Pure options string without "\r" && "\n"
 */
+ (NSString *)getPureOptionsString:(id)optionsObject;

+ (NSString *)getPureStringWithJSONObject:(id)objc;

/**
 Get pure series string
 
 @param series Series array of AAOptions
 @return Pure series string without "\r" && "\n"
 */
+ (NSString *)getPureSeriesStringWithSeriesArray:(NSArray<NSDictionary*> *)series;

/**
 Get jsonObject from json string

 @param string json string
 @return json object
 */
+ (id)jsonObjectWithJsonString:(NSString *)string;

@end

