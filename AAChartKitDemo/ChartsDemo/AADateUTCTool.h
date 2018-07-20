//
//  AADateUTCTool.h
//  AAChartKitDemo
//
//  Created by AnAn on 2018/7/20.
//  Copyright © 2018年 Danny boy. All rights reserved.
//

#import <Foundation/Foundation.h>
#define AADateUTC(yyyy,mm,dd)    [AADateUTCTool getDateUTCWithYear:yyyy month:mm day:dd]

@interface AADateUTCTool : NSObject

+ (NSNumber *)getDateUTCWithYear:(int )year month:(int )month day:(int )day;

@end
