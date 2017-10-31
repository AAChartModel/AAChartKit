//
//  AAStyle.m
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

/*
 
 * -------------------------------------------------------------------------------
 *
 * ❀❀❀   WARM TIPS!!!   ❀❀❀
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

#import "AAStyle.h"
//Styles for the label. 默认是：{"color": "contrast", "fontSize": "11px", "fontWeight": "bold", "textOutline": "1px 1px contrast" }.

@implementation AAStyle

-(instancetype)init{
    self = [super init];
    if (self) {
        self.color = @"#ffffff";
        self.fontSize = @"11px";
        self.fontWeight = @"bold";
        self.textOutline = @"1px 1px contrast";
    }
    return self;
}

AAPropSetFuncImplementation(AAStyle, NSString *, color);
AAPropSetFuncImplementation(AAStyle, NSString *, fontSize);
AAPropSetFuncImplementation(AAStyle, NSString *, fontWeight);
AAPropSetFuncImplementation(AAStyle, NSString *, textOutline);

@end
