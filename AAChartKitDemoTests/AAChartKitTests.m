//
//  AAChartKitTests.m
//  AAChartKitTests
//
//  Created by An An on 17/3/13.
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

#import <XCTest/XCTest.h>
#import "BasicChartComposer.h"

@interface AAChartKitTests : XCTestCase

@end

@implementation AAChartKitTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConvertToAAChartTypeMapsEachBasicChartType {
    NSArray<NSString *> *expectedChartTypes = @[
        AAChartTypeColumn,
        AAChartTypeBar,
        AAChartTypeArea,
        AAChartTypeAreaspline,
        AAChartTypeLine,
        AAChartTypeSpline,
        AAChartTypeLine,
        AAChartTypeArea,
        AAChartTypeScatter,
    ];

    for (NSInteger chartType = BasicChartVCChartTypeColumn; chartType <= BasicChartVCChartTypeScatter; chartType++) {
        XCTAssertEqualObjects([BasicChartComposer convertToAAChartType:(BasicChartVCChartType)chartType],
                              expectedChartTypes[(NSUInteger)chartType]);
    }
}

- (void)testConfigureChartModelWithColumnAppliesBaseAndColumnStyle {
    AAChartModel *chartModel = [BasicChartComposer configureChartModelWithChartType:BasicChartVCChartTypeColumn];

    XCTAssertEqualObjects(chartModel.chartType, AAChartTypeColumn);
    XCTAssertEqual(chartModel.animationType, AAChartAnimationEaseOutCubic);
    XCTAssertEqualObjects(chartModel.animationDuration, @1200);
    XCTAssertEqualObjects(chartModel.tooltipValueSuffix, @"℃");
    XCTAssertEqualObjects(chartModel.categories.firstObject, @"Java");
    XCTAssertEqual(chartModel.categories.count, 13);
    XCTAssertEqual(chartModel.series.count, 4);
    XCTAssertEqual(chartModel.yAxisPlotLines.count, 3);
}

- (void)testConfigureChartModelWithAreasplineUsesAreasplineSpecificSeries {
    AAChartModel *chartModel = [BasicChartComposer configureChartModelWithChartType:BasicChartVCChartTypeAreaspline];

    XCTAssertEqualObjects(chartModel.chartType, AAChartTypeAreaspline);
    XCTAssertEqualObjects(chartModel.markerSymbolStyle, AAChartSymbolStyleTypeInnerBlank);
    XCTAssertEqualObjects(chartModel.xAxisTickInterval, @3);
    XCTAssertEqual(chartModel.series.count, 4);

    AASeriesElement *firstSeries = chartModel.series.firstObject;
    XCTAssertEqualObjects(firstSeries.name, @"Predefined symbol");
    XCTAssertEqual(((NSArray *)firstSeries.data).count, 24);
}

- (void)testConfigureChartModelWithSplineHidesMarkersAndUsesSplineSamples {
    AAChartModel *chartModel = [BasicChartComposer configureChartModelWithChartType:BasicChartVCChartTypeSpline];

    XCTAssertEqualObjects(chartModel.chartType, AAChartTypeSpline);
    XCTAssertEqualObjects(chartModel.markerSymbolStyle, AAChartSymbolStyleTypeBorderBlank);
    XCTAssertEqualObjects(chartModel.markerRadius, @0);
    XCTAssertEqual(chartModel.series.count, 4);

    AASeriesElement *firstSeries = chartModel.series.firstObject;
    XCTAssertEqualObjects(firstSeries.name, @"2017");
    XCTAssertEqualObjects(firstSeries.lineWidth, @5);
    XCTAssertEqual(((NSArray *)firstSeries.data).count, 6);
}

- (void)testConfigureChartModelWithStepLineMarksEachSeriesAsStep {
    AAChartModel *chartModel = [BasicChartComposer configureChartModelWithChartType:BasicChartVCChartTypeStepLine];

    XCTAssertEqualObjects(chartModel.chartType, AAChartTypeLine);
    XCTAssertFalse(chartModel.yAxisVisible);
    XCTAssertEqualObjects(chartModel.markerSymbolStyle, AAChartSymbolStyleTypeBorderBlank);
    XCTAssertEqual(chartModel.series.count, 3);
    XCTAssertTrue([self aa_chartModelSeriesHaveStep:chartModel.series]);
}

- (void)testConfigureChartModelWithScatterKeepsBaseSeriesWithoutStepMarkers {
    AAChartModel *chartModel = [BasicChartComposer configureChartModelWithChartType:BasicChartVCChartTypeScatter];

    XCTAssertEqualObjects(chartModel.chartType, AAChartTypeScatter);
    XCTAssertTrue(chartModel.yAxisVisible);
    XCTAssertEqualObjects(chartModel.markerRadius, @5);
    XCTAssertEqual(chartModel.series.count, 4);
    XCTAssertFalse([self aa_chartModelSeriesHaveStep:chartModel.series]);
}

- (BOOL)aa_chartModelSeriesHaveStep:(NSArray<AASeriesElement *> *)series {
    for (AASeriesElement *seriesElement in series) {
        if ([seriesElement.step respondsToSelector:@selector(boolValue)] && [seriesElement.step boolValue]) {
            return YES;
        }
    }

    return NO;
}

@end
