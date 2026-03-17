//
//  PolarChartOptionsComposer.h
//  AAChartKitDemo
//

#import <Foundation/Foundation.h>
#import "AAChartKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface PolarChartOptionsComposer : NSObject

+ (AAOptions *)configureThePolygonPolarChart;
+ (AAOptions *)adjustGroupPaddingForPolarChart;
+ (AAOptions *)configureTriangleRadarChart;
+ (AAOptions *)configureQuadrangleRadarChart;
+ (AAOptions *)configurePentagonRadarChart;
+ (AAOptions *)configureHexagonRadarChart;
+ (AAOptions *)configureSpiderWebRadarChart;
+ (AAOptions *)radarChartWithCategories;

@end

NS_ASSUME_NONNULL_END
