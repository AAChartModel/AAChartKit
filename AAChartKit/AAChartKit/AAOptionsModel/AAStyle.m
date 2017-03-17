//
//  AAStyle.m
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright © 2017年 An An. All rights reserved.
//

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
