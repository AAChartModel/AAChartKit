//
//  AAGradientColor.m
//  AAChartKitDemo
//
//  Created by AnAn on 2018/11/18.
//  Copyright © 2018 Danny boy. All rights reserved.
//

#import "AAGradientColor.h"

@implementation AAGradientColor
    

    + (NSDictionary *)oceanBlue {
        return [self configureGradientColorWithStartColorString:@"2E3192" endColorString:@"1BFFFF"];
    }
    
    + (NSDictionary *)sanguine {
        return [self configureGradientColorWithStartColorString:@"D4145A" endColorString:@"FBB03B"];
    }
    
    + (NSDictionary *)lusciousLime {
        return [self configureGradientColorWithStartColorString:@"009245" endColorString:@"FCEE21"];
    }
    
    + (NSDictionary *)purpleLake {
        return [self configureGradientColorWithStartColorString:@"662D8C" endColorString:@"ED1E79"];
    }
    
    + (NSDictionary *)freshPapaya {
        return [self configureGradientColorWithStartColorString:@"ED1C24" endColorString:@"FCEE21"];
    }
    
    + (NSDictionary *)ultramarine {
        return [self configureGradientColorWithStartColorString:@"00A8C5" endColorString:@"FFFF7E"];
    }
    
    + (NSDictionary *)pinkSugar {
        return [self configureGradientColorWithStartColorString:@"D74177" endColorString:@"FFE98A"];
    }
    
    + (NSDictionary *)lemonDrizzle {
        return [self configureGradientColorWithStartColorString:@"FB872B" endColorString:@"D9E021"];
    }
    
    + (NSDictionary *)victoriaPurple {
        return [self configureGradientColorWithStartColorString:@"312A6C" endColorString:@"852D91"];
    }
    
    + (NSDictionary *)springGreens {
        return [self configureGradientColorWithStartColorString:@"009E00" endColorString:@"FFFF96"];
    }
    
    + (NSDictionary *)mysticMauve {
        return [self configureGradientColorWithStartColorString:@"B066FE" endColorString:@"63E2FF"];
    }
    
    + (NSDictionary *)reflexSilver {
        return [self configureGradientColorWithStartColorString:@"808080" endColorString:@"E6E6E6"];
    }
    
    + (NSDictionary *)neonGlow {
        return [self configureGradientColorWithStartColorString:@"00FFA1" endColorString:@"00FFFF"];
    }
    
    + (NSDictionary *)berrySmoothie {
        return [self configureGradientColorWithStartColorString:@"8E78FF" endColorString:@"FC7D7B"];
    }
    
    + (NSDictionary *)newLeaf {
        return [self configureGradientColorWithStartColorString:@"00537E" endColorString:@"3AA17E"];
    }
    
    + (NSDictionary *)cottonCandy {
        return [self configureGradientColorWithStartColorString:@"FCA5F1" endColorString:@"B5FFFF"];
    }
    
    + (NSDictionary *)pixieDust {
        return [self configureGradientColorWithStartColorString:@"D585FF" endColorString:@"00FFEE"];
    }
    
    + (NSDictionary *)fizzyPeach {
        return [self configureGradientColorWithStartColorString:@"F24645" endColorString:@"EBC08D"];
    }
    
    + (NSDictionary *)sweetDream {
        return [self configureGradientColorWithStartColorString:@"3A3897" endColorString:@"A3A1FF"];
    }
    
    + (NSDictionary *)firebrick {
        return [self configureGradientColorWithStartColorString:@"45145A" endColorString:@"FF5300"];
    }
    
    + (NSDictionary *)wroughtIron {
        return [self configureGradientColorWithStartColorString:@"333333" endColorString:@"5A5454"];
    }
    
    + (NSDictionary *)deepSea {
        return [self configureGradientColorWithStartColorString:@"4F00BC" endColorString:@"29ABE2"];
    }
    
    + (NSDictionary *)coastalBreeze {
        return [self configureGradientColorWithStartColorString:@"00B7FF" endColorString:@"FFFFC7"];
    }
    
    + (NSDictionary *)eveningDelight {
        return [self configureGradientColorWithStartColorString:@"93278F" endColorString:@"00A99D"];
    }
    
    
    + (NSDictionary *)configureGradientColorWithStartColorString:(NSString *)startColorStr
                                                  endColorString:(NSString *)endColorStr {
        return @{
                 @"linearGradient": @{
                         @"x1": @0,
                         @"y1": @1,
                         @"x2": @0,
                         @"y2": @0
                         },
                 @"stops": @[@[@0,[NSString stringWithFormat:@"#%@",startColorStr]],
                             @[@1,[NSString stringWithFormat:@"#%@",endColorStr]]]//颜色字符串设置支持十六进制类型和 rgba 类型
                 };
    }
    
    @end

