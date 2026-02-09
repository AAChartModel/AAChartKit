//
//  TooltipOptionsComposer.h
//  AAChartKitDemo
//

#import <Foundation/Foundation.h>
#import "AAChartKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface TooltipOptionsComposer : NSObject

+ (AAOptions *)customTooltipStyleByFormatProperties;
+ (AAOptions *)customAreaChartTooltipStyleLikeHTMLTable;
+ (AAOptions *)customAreasplineChartTooltipContentWithHeaderFormat;
+ (AAOptions *)customAreaChartTooltipStyleWithTotalValueHeader;
+ (AAOptions *)customBoxplotTooltipContent;

@end

NS_ASSUME_NONNULL_END
