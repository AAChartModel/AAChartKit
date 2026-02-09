#import <Foundation/Foundation.h>

@class AAOptions;

NS_ASSUME_NONNULL_BEGIN

@interface JSFunctionForAALegendComposer : NSObject

+ (id)chartConfigurationWithSelectedIndex:(NSInteger)selectedIndex;

+ (AAOptions *)disableLegendClickEventForNormalChart;
+ (AAOptions *)disableLegendClickEventForPieChart;
+ (AAOptions *)customLegendItemClickEvent;

@end

NS_ASSUME_NONNULL_END
