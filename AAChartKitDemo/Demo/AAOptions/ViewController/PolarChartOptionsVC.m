//
//  PolarChartOptionsVC.m
//  AAChartKitDemo
//

#import "PolarChartOptionsVC.h"
#import "PolarChartOptionsComposer.h"

@implementation PolarChartOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex {
    switch (selectedIndex) {
        case 0: return [PolarChartOptionsComposer configureThePolygonPolarChart];//简单的多边形雷达图
        case 1: return [PolarChartOptionsComposer adjustGroupPaddingForPolarChart];//调整柱状极地图的 GroupPadding
        case 2: return [PolarChartOptionsComposer configureTriangleRadarChart];//带有颜色标志带的三角形雷达图
        case 3: return [PolarChartOptionsComposer configureQuadrangleRadarChart];//带有颜色标志带的四角形雷达图
        case 4: return [PolarChartOptionsComposer configurePentagonRadarChart];//带有颜色标志带的五角形雷达图
        case 5: return [PolarChartOptionsComposer configureHexagonRadarChart];//带有颜色标志带的六角形雷达图
        case 6: return [PolarChartOptionsComposer configureSpiderWebRadarChart];//带有颜色标志带的🕸蜘蛛网状雷达图
        case 7: return [PolarChartOptionsComposer radarChartWithCategories];//五边形雷达图示例(带有类别文字)

        default:
            break;
    }
    return nil;
}

@end
