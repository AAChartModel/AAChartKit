//
//  AAChartView.h
//  AAChartKit
//
//  Created by An An on 17/1/16.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//
#import <UIKit/UIKit.h>
#import "AAChartModel.h"
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
@property (nonatomic, assign) BOOL     chartSeriesHidden;

/**
 Set the chart view background color be clear
 */
@property (nonatomic, assign) BOOL     isClearBackgroundColor;
/**
 Function of drawing chart view
 
 @param chartModel The instance object of chart model
 */
- (void)aa_drawChartWithChartModel:(AAChartModel *)chartModel;

/**
 Function of refreshing whole chart view content
 
 @param chartModel The instance object of chart model
 */
- (void)aa_refreshChartWithChartModel:(AAChartModel *)chartModel;

/**
 Function of only refresh the chart data
 
 @param series  Series array of AAChartModel instance object
 */
- (void)aa_onlyRefreshTheChartDataWithChartModelSeries:(NSArray<NSDictionary *> *)series;
    


/**
 Function of drawing chart view

 @param options The instance object of chart options
 */
- (void)aa_drawChartWithOptions:(AAOptions *)options;
    
/**
 Function of refreshing whole chart view content

 @param options The instance object of chart options
 */
- (void)aa_refreshChartWithOptions:(AAOptions *)options;
    
/**
 Function of only refresh the chart data

 @param series Series array of AAOptions instance object
 */
- (void)aa_onlyRefreshTheChartDataWithOptionsSeries:(NSArray<NSDictionary *> *)series;




/**
 Show the series element content with index
 
 @param elementIndex element index
 */
- (void)aa_showTheSeriesElementContentWithSeriesElementIndex:(NSInteger)elementIndex;

@end

