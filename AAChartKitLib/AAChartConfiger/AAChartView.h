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
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */
#import <UIKit/UIKit.h>
#import "AAOptions.h"

@protocol AAChartViewDidFinishLoadDelegate<NSObject>

/**
 The delegate method of chart view finish loading
 */
- (void)AAChartViewDidFinishLoad;

@end

@interface AAChartView:UIView

@property (nonatomic, weak)   id<AAChartViewDidFinishLoadDelegate> delegate;

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

@property (nonatomic, assign) BOOL blurEffectEnabled;


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
 Get pure options string
 
 @param optionsObject Instance object of AAOptions
 @return Pure options string without "\r" && "\n"
 */
+ (NSString *)getPureOptionsString:(id)optionsObject;


/**
 Get pure series string
 
 @param series Series array of AAOptions
 @return Pure series string without "\r" && "\n"
 */
+ (NSString *)getPureSeriesString:(NSArray<NSDictionary*> *)series;

@end

