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
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import <WebKit/WebKit.h>
#import "AAOptions.h"
#import "NSString+toPureJSString.h"

@interface AAEventMessageModel : NSObject

@property (nonatomic, copy)   NSString *name;
@property (nonatomic, strong) NSNumber *x;
@property (nonatomic, strong) NSNumber *y;
@property (nonatomic, copy)   NSString *category;
@property (nonatomic, strong) NSDictionary *offset;
@property (nonatomic, assign) NSUInteger index;

@end


@interface AAClickEventMessageModel : AAEventMessageModel
@end


@interface AAMoveOverEventMessageModel : AAEventMessageModel
@end


@class AAChartView;

@protocol AAChartViewEventDelegate<NSObject>

@optional

/// The delegate method of chart view finish loading
/// @param aaChartView AAChartView object instance
- (void)aaChartViewDidFinishLoad:(AAChartView *)aaChartView;


/// The delegate method of getting click event message model
/// @param aaChartView The instance object of chart view
/// @param message User finger click event message model
- (void)aaChartView:(AAChartView *)aaChartView clickEventWithMessage:(AAClickEventMessageModel *)message;

/// The delegate method of getting move over event message model
/// @param aaChartView The instance object of chart view
/// @param message User finger move over event message model
- (void)aaChartView:(AAChartView *)aaChartView moveOverEventWithMessage:(AAMoveOverEventMessageModel *)message;

/// The delegate method that did receive JavaScript event Message
/// @param aaChartView The instance object of chart view
/// @param message JavaScript event Message
- (void)aaChartView:(AAChartView *)aaChartView didReceiveScriptMessage:(WKScriptMessage *)message;


@end

typedef void(^AADidFinishLoadBlock)(AAChartView *aaChartView);
typedef void(^AAClickEventBlock)(AAChartView *aaChartView, AAClickEventMessageModel *message);
typedef void(^AAMoveOverEventBlock)(AAChartView *aaChartView, AAMoveOverEventMessageModel *message);
typedef void(^AADidReceiveScriptMessageBlock)(AAChartView *aaChartView, WKScriptMessage *message);


@interface AAChartView : WKWebView

#if TARGET_OS_IPHONE
/// Configure the behavior of adjustedContentInset.
/// Default is UIScrollViewContentInsetAdjustmentAutomatic.
@property(nonatomic) UIScrollViewContentInsetAdjustmentBehavior contentInsetAdjustmentBehavior API_AVAILABLE(ios(11.0),tvos(11.0));

/// Set the chart view can scroll or not
@property (nonatomic, assign) BOOL scrollEnabled;
#endif

/// Set the chart view background color be clear
@property (nonatomic, assign) BOOL isClearBackgroundColor;

/// Content width of AAChartView
@property (nonatomic, assign) CGFloat  contentWidth;

/// Content height of AAChartView
@property (nonatomic, assign) CGFloat  contentHeight;

/// Hide chart series content or not
@property (nonatomic, assign) BOOL chartSeriesHidden;

/// The AAChartView did finish load event and move over event delegate
@property (nonatomic, weak)   id<AAChartViewEventDelegate> delegate;

/// The block method of chart view finish loading
@property (nonatomic, copy) AADidFinishLoadBlock didFinishLoadBlock;

/// The block method of user finger click event
@property (nonatomic, copy) AAClickEventBlock clickEventBlock;

/// The block method of user finger move over event
@property (nonatomic, copy) AAMoveOverEventBlock moveOverEventBlock;

/// The block method that did receive JavaScript event Message
@property (nonatomic, copy) AADidReceiveScriptMessageBlock didReceiveScriptMessageBlock;


/// Chart view finish loading event handler
/// @param handler event handler
- (void)didFinishLoadHandler:(AADidFinishLoadBlock)handler;

/// Chart view getting click event message model
/// @param handler event handler
- (void)clickEventHandler:(AAClickEventBlock)handler;

/// Chart view getting move over event message model
/// @param handler event handler
- (void)moveOverEventHandler:(AAMoveOverEventBlock)handler;

/// Chart view did receive JavaScript event Message
/// @param handler JavaScript event Message
- (void)didReceiveScriptMessageHandler:(AADidReceiveScriptMessageBlock)handler;


#pragma mark - Configure Chart View Content With AAChartModel

/// Function of drawing chart view
/// @param chartModel The instance object of AAChartModel
- (void)aa_drawChartWithChartModel:(AAChartModel *)chartModel;

/// Function of only refresh the chart data
/// @param series Series array of AAChartModel instance object
- (void)aa_onlyRefreshTheChartDataWithChartModelSeries:(NSArray<AASeriesElement *> *)series;

/// Function to refresh chart data only
/// @param series Series array of AAOptions instance object
/// @param animation Have animation effect or not
- (void)aa_onlyRefreshTheChartDataWithChartModelSeries:(NSArray<AASeriesElement *> *)series animation:(BOOL)animation;

/// Function of refreshing whole chart view content
/// @param chartModel The instance object of AAChartModel
- (void)aa_refreshChartWithChartModel:(AAChartModel *)chartModel;


#pragma mark - Configure Chart View Content With AAOptions

/// Function of drawing chart view
/// @param options The instance object of AAOptions
- (void)aa_drawChartWithOptions:(AAOptions *)options;

/// Function of only refresh the chart data
/// @param series Series array of AAOptions instance object
- (void)aa_onlyRefreshTheChartDataWithOptionsSeries:(NSArray<AASeriesElement *> *)series;

/// Function to refresh chart data only
/// @param series Series array of AAOptions instance object
/// @param animation Have animation effect or not
- (void)aa_onlyRefreshTheChartDataWithOptionsSeries:(NSArray<AASeriesElement *> *)series animation:(BOOL)animation;

/// Function of refreshing whole chart view content
/// @param options The instance object of AAOptions
- (void)aa_refreshChartWithOptions:(AAOptions *)options;


- (void)aa_updateChartWithOptions:(id)options;

/// A common chart update function
/// (you can update any chart element) to open, close, delete, add, resize, reformat, etc. elements in the chart.
/// Refer to https://api.highcharts.com/highcharts#Chart.update
///
/// It should be noted that when updating the array configuration,
/// for example, when updating configuration attributes including arrays such as xAxis, yAxis, series, etc., the updated data will find existing objects based on id and update them. If no id is configured or passed If the id does not find the corresponding object, the first element of the array is updated. Please refer to this example for details.
///
/// In a responsive configuration, the response of the different rules responsive.rules is actually calling chart.update, and the updated content is configured in chartOptions.
///
/// @param options A configuration object for the new chart options as defined in the options section of the API.
/// @param redraw Whether to redraw after updating the chart, the default is true
- (void)aa_updateChartWithOptions:(id)options redraw:(BOOL)redraw;


- (void)aa_addPointToChartSeriesElementWithElementIndex:(NSUInteger)elementIndex
                                                options:(id)options;

- (void)aa_addPointToChartSeriesElementWithElementIndex:(NSUInteger)elementIndex
                                                options:(id)options
                                                  shift:(BOOL)shift;

/// Add a new point to the data column after the chart has been rendered.
/// The new point can be the last point, or it can be placed in the corresponding position given the X value (first, middle position, depending on the x value)
/// Refer to https://api.highcharts.com/highcharts#Series.addPoint
///
/// @param elementIndex The specific series element
/// @param options The configuration of the data point can be a single value, indicating the y value of the data point; it can also be an array containing x and y values; it can also be an object containing detailed data point configuration. For detailed configuration, see series.data.
/// @param redraw The default is true, whether to redraw the icon after the operation is completed. When you need to add more than one point, it is highly recommended to set redraw to false and manually call chart.redraw() to redraw the chart after all operations have ended.
/// @param shift The default is false. When this property is true, adding a new point will delete the first point in the data column (that is, keep the total number of data points in the data column unchanged). This property is very useful in the inspection chart
/// @param animation The default is true, which means that when adding a point, it contains the default animation effect. This parameter can also be passed to the object form containing duration and easing. For details, refer to the animation related configuration.
- (void)aa_addPointToChartSeriesElementWithElementIndex:(NSUInteger)elementIndex
                                                options:(id)options
                                                 redraw:(BOOL)redraw
                                                  shift:(BOOL)shift
                                              animation:(BOOL)animation;


- (void)aa_addPointsToChartSeriesArrayWithOptionsArray:(NSArray *)optionsArr;

/// Add a new group of points to the data column after the chart has been rendered.
///
- (void)aa_addPointsToChartSeriesArrayWithOptionsArray:(NSArray *)optionsArr
                                                 shift:(BOOL)shift
                                             animation:(BOOL)animation;

/// Add a new series element to the chart after the chart has been rendered.
/// Refer to https://api.highcharts.com/highcharts#Chart.addSeries
///
/// @param element Chart series element
- (void)aa_addElementToChartSeriesWithElement:(AASeriesElement *)element;

/// Remove a specific series element from the chart after the chart has been rendered.
/// Refer to https://api.highcharts.com/highcharts#Series.remove
///
/// @param elementIndex Chart series element index
- (void)aa_removeElementFromChartSeriesWithElementIndex:(NSUInteger)elementIndex;


/// Show the series element content with index
/// @param elementIndex Chart series element index
- (void)aa_showTheSeriesElementContentWithSeriesElementIndex:(NSUInteger)elementIndex;

/// Hide the series element content with index
/// @param elementIndex Chart series element index
- (void)aa_hideTheSeriesElementContentWithSeriesElementIndex:(NSUInteger)elementIndex;


/// Evaluate the JavaScript string by converting JavaScript string into JavaScript function
/// @param JavaScriptString Valid JavaScript function code
- (void)aa_evaluateJavaScriptStringFunction:(NSString *)JavaScriptString;


/// Update the X axis categories of chart
/// @param categories The X axis categories array
- (void)aa_updateXAxisCategories:(NSArray *)categories;


/// Update the X axis categories of chart
/// @param categories The X axis categories array
/// @param redraw Redraw whole chart or not
- (void)aa_updateXAxisCategories:(NSArray *)categories redraw:(BOOL)redraw;


/// Update the X axis Extremes
/// @param min X axis minimum
/// @param max X axis maximum
- (void)aa_updateXAxisExtremesWithMin:(NSUInteger)min max:(NSUInteger)max;


/// Redraw chart view
/// @param animation Have animation effect or not
- (void)aa_redrawWithAnimation:(BOOL)animation;

#if TARGET_OS_IPHONE
/// Set the chart view content be adaptive to screen rotation with default animation effect
- (void)aa_adaptiveScreenRotation;

/// Set the chart view content be adaptive to screen rotation with custom animation effect
/// Refer to https://api.highcharts.com/highcharts#Chart.setSize
///
/// @param animation The instance object of AAAnimation
- (void)aa_adaptiveScreenRotationWithAnimation:(AAAnimation *)animation;
#endif

/// Change chart view content size
/// @param width content size width
/// @param height content size height
/// @param animation The instance object of AAAnimation
- (void)aa_changeChartSizeWithWidth:(CGFloat)width
                             height:(CGFloat)height
                          animation:(AAAnimation *)animation;

@end


@interface AAJsonConverter : NSObject

/// Convert Object to be Dictionary
/// @param objc  object instance
+ (NSDictionary*)dictionaryWithObjectInstance:(id)objc;

/// Get pure options Json string from option instance
/// @param optionsObject Instance object of AAOptions
+ (NSString *)pureOptionsJsonStringWithOptionsInstance:(id)optionsObject;

/// Get pure Json string from Json object
/// @param jsonObjc Instance object of Json object
+ (NSString *)pureJsonStringWithJsonObject:(id)jsonObjc;


@end

