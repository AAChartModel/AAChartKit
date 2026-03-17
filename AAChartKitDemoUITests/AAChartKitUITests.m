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

- (void)testBasicChartVCColumnComprehensiveInteractions {
    XCUIApplication *app = [self aa_launchBasicChartWithType:0 exposeChartState:YES];

    XCTAssertTrue([app.webViews[@"basic-chart.chart-view"] waitForExistenceWithTimeout:5.0]);
    XCTAssertTrue([app.otherElements[@"basic-chart.state"] waitForExistenceWithTimeout:5.0]);

    XCUIElement *stackingControl = app.segmentedControls[@"basic-chart.segmented.0"];
    XCUIElement *cornerControl = app.segmentedControls[@"basic-chart.segmented.1"];
    XCUIElement *nextTypeButton = app.buttons[@"basic-chart.next-type"];
    XCTAssertTrue(stackingControl.exists);
    XCTAssertTrue(cornerControl.exists);
    XCTAssertTrue(nextTypeButton.exists);
    XCTAssertEqual(stackingControl.buttons.count, 3);
    XCTAssertEqual(cornerControl.buttons.count, 3);
    XCTAssertTrue(app.switches[@"basic-chart.switch.0"].exists);
    XCTAssertTrue(app.switches[@"basic-chart.switch.1"].exists);
    XCTAssertTrue(app.switches[@"basic-chart.switch.2"].exists);
    XCTAssertTrue(app.switches[@"basic-chart.switch.3"].exists);
    XCTAssertTrue(app.switches[@"basic-chart.switch.4"].exists);
    XCTAssertFalse(app.switches[@"basic-chart.switch.5"].exists);

    [self aa_assertChartStateInApp:app matches:@{
        @"chartType": @"column",
        @"stacking": @"false",
        @"borderRadius": @0,
        @"xAxisReversed": @NO,
        @"yAxisReversed": @NO,
        @"inverted": @NO,
        @"polar": @NO,
        @"dataLabelsEnabled": @NO,
    }];

    [stackingControl.buttons[@"Normal stacking"] tap];
    [self aa_assertChartStateInApp:app matches:@{@"stacking": @"normal"}];

    [stackingControl.buttons[@"Percent stacking"] tap];
    [self aa_assertChartStateInApp:app matches:@{@"stacking": @"percent"}];

    [stackingControl.buttons[@"No stacking"] tap];
    [self aa_assertChartStateInApp:app matches:@{@"stacking": @"false"}];

    [cornerControl.buttons[@"Rounded corners"] tap];
    [self aa_assertChartStateInApp:app matches:@{@"borderRadius": @10}];

    [cornerControl.buttons[@"Wedge"] tap];
    [self aa_assertChartStateInApp:app matches:@{@"borderRadius": @100}];

    [cornerControl.buttons[@"Square corners"] tap];
    [self aa_assertChartStateInApp:app matches:@{@"borderRadius": @0}];

    [self aa_assertSwitchWithIdentifier:@"basic-chart.switch.0"
                         togglesStateKey:@"xAxisReversed"
                                   inApp:app];
    [self aa_assertSwitchWithIdentifier:@"basic-chart.switch.1"
                         togglesStateKey:@"yAxisReversed"
                                   inApp:app];
    [self aa_assertSwitchWithIdentifier:@"basic-chart.switch.2"
                         togglesStateKey:@"inverted"
                                   inApp:app];
    [self aa_assertSwitchWithIdentifier:@"basic-chart.switch.3"
                         togglesStateKey:@"polar"
                                   inApp:app];
    [self aa_assertSwitchWithIdentifier:@"basic-chart.switch.4"
                         togglesStateKey:@"dataLabelsEnabled"
                                   inApp:app];
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
    return [self aa_launchBasicChartWithType:chartType exposeChartState:NO];
}

- (XCUIApplication *)aa_launchBasicChartWithType:(NSInteger)chartType exposeChartState:(BOOL)exposeChartState {
    self.app = [[XCUIApplication alloc] init];
    NSMutableArray<NSString *> *launchArguments = [NSMutableArray arrayWithArray:@[
        @"-UITestBasicChartType",
        [NSString stringWithFormat:@"%ld", (long)chartType],
    ]];
    if (exposeChartState) {
        [launchArguments addObject:@"-UITestExposeChartState"];
    }
    self.app.launchArguments = launchArguments;
    [self.app launch];
    return self.app;
}

- (void)aa_assertSwitchWithIdentifier:(NSString *)identifier
                      togglesStateKey:(NSString *)stateKey
                                inApp:(XCUIApplication *)app {
    XCUIElement *switchElement = app.switches[identifier];
    XCTAssertTrue(switchElement.exists);

    [switchElement tap];
    [self aa_assertChartStateInApp:app matches:@{stateKey: @YES}];

    [switchElement tap];
    [self aa_assertChartStateInApp:app matches:@{stateKey: @NO}];
}

- (void)aa_assertChartStateInApp:(XCUIApplication *)app matches:(NSDictionary<NSString *, id> *)expectedState {
    NSDate *deadline = [NSDate dateWithTimeIntervalSinceNow:5.0];
    NSDictionary<NSString *, id> *lastState = nil;

    while (deadline.timeIntervalSinceNow > 0) {
        lastState = [self aa_chartStateFromApp:app];
        if ([self aa_chartState:lastState containsExpectedEntries:expectedState]) {
            return;
        }

        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }

    XCTFail(@"Expected chart state %@, got %@", expectedState, lastState);
}

- (NSDictionary<NSString *, id> *)aa_chartStateFromApp:(XCUIApplication *)app {
    XCUIElement *stateElement = app.otherElements[@"basic-chart.state"];
    XCTAssertTrue(stateElement.exists);

    id rawValue = stateElement.value;
    XCTAssertTrue([rawValue isKindOfClass:[NSString class]]);

    NSError *error;
    NSData *jsonData = [(NSString *)rawValue dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary<NSString *, id> *state = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                           options:0
                                                                             error:&error];
    XCTAssertNil(error);
    XCTAssertTrue([state isKindOfClass:[NSDictionary class]]);
    return state;
}

- (BOOL)aa_chartState:(NSDictionary<NSString *, id> *)state
 containsExpectedEntries:(NSDictionary<NSString *, id> *)expectedState {
    for (NSString *key in expectedState) {
        if (![state[key] isEqual:expectedState[key]]) {
            return NO;
        }
    }

    return YES;
}

@end
