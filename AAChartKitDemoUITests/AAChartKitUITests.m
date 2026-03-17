//
//  AAChartKitUITests.m
//  AAChartKitUITests
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

@interface AAChartKitUITests : XCTestCase
@property (nonatomic, strong) XCUIApplication *app;

@end

@implementation AAChartKitUITests

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
}

- (void)testBasicChartVCColumnLayout {
    XCUIApplication *app = [self aa_launchBasicChartWithType:0];

    XCTAssertTrue([app.webViews[@"basic-chart.chart-view"] waitForExistenceWithTimeout:5.0]);

    XCUIElement *stackingControl = app.segmentedControls[@"basic-chart.segmented.0"];
    XCUIElement *cornerControl = app.segmentedControls[@"basic-chart.segmented.1"];
    XCUIElement *nextTypeButton = app.buttons[@"basic-chart.next-type"];
    XCTAssertTrue(stackingControl.exists);
    XCTAssertTrue(cornerControl.exists);
    XCTAssertTrue(nextTypeButton.exists);
    XCTAssertEqual(stackingControl.buttons.count, 3);
    XCTAssertEqual(cornerControl.buttons.count, 3);

    XCTAssertTrue(app.switches[@"basic-chart.switch.4"].exists);
    XCTAssertFalse(app.switches[@"basic-chart.switch.5"].exists);
}

- (void)testBasicChartVCLineInteractions {
    XCUIApplication *app = [self aa_launchBasicChartWithType:4];

    XCTAssertTrue([app.navigationBars.staticTexts[@"line chart"] waitForExistenceWithTimeout:5.0]);
    XCTAssertTrue([app.webViews[@"basic-chart.chart-view"] waitForExistenceWithTimeout:5.0]);

    XCUIElement *stackingControl = app.segmentedControls[@"basic-chart.segmented.0"];
    XCUIElement *markerControl = app.segmentedControls[@"basic-chart.segmented.1"];
    XCTAssertEqual(stackingControl.buttons.count, 3);
    XCTAssertEqual(markerControl.buttons.count, 5);

    XCUIElement *triangleButton = markerControl.buttons[@"▲ ▲ ▲"];
    XCTAssertTrue(triangleButton.exists);
    [triangleButton tap];
    XCTAssertTrue(triangleButton.isSelected);

    XCUIElement *hideMarkerSwitch = app.switches[@"basic-chart.switch.5"];
    XCTAssertTrue(hideMarkerSwitch.exists);
    id initialValue = hideMarkerSwitch.value;
    [hideMarkerSwitch tap];
    XCTAssertNotEqualObjects(initialValue, hideMarkerSwitch.value);
}

- (XCUIApplication *)aa_launchBasicChartWithType:(NSInteger)chartType {
    self.app = [[XCUIApplication alloc] init];
    self.app.launchArguments = @[
        @"-UITestBasicChartType",
        [NSString stringWithFormat:@"%ld", (long)chartType],
    ];
    [self.app launch];
    return self.app;
}

@end
