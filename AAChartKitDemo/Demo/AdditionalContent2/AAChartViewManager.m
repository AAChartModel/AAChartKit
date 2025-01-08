//
//  AAChartViewManager.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/8/30.
//  Copyright © 2024 An An. All rights reserved.
//

#import "AAChartViewManager.h"
#import "AAChartKit.h"

@implementation AAChartViewManager

+ (instancetype)sharedInstance {
    static AAChartViewManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // 初始化 chartView 属性
        self.aaChartView = [[AAChartView alloc] init];
        [self setupAAChartViewEventBlockHandler];
    }
    return self;
}

- (void)setupAAChartViewEventBlockHandler {
    __weak __typeof__(self) weakSelf = self;

    //获取图表加载完成事件
    [_aaChartView didFinishLoadHandler:^(AAChartView *aaChartView) {
        NSLog(@"🚀🚀🚀🚀 AAChartView content did finish load!!!");

//        NSString *jsStr = [ weakSelf configureAddEventForXAxisLabelsGroupElementJSFunctionString];
//        [weakSelf.aaChartView aa_evaluateJavaScriptStringFunction:jsStr];
    }];

    //获取图表上的手指点击事件
    [_aaChartView clickEventHandler:^(AAChartView *aaChartView,
                                      AAClickEventMessageModel *message) {
        NSDictionary *messageDic = [weakSelf eventMessageModelWithMessageBody:message];
        [weakSelf printPrettyPrintedClickEventMessageJsonStringWithJsonObject:messageDic];
    }];
    
    //获取图表上的手指点击及滑动事件
    [_aaChartView moveOverEventHandler:^(AAChartView *aaChartView,
                                         AAMoveOverEventMessageModel *message) {
        NSDictionary *messageDic = [weakSelf eventMessageModelWithMessageBody:message];
        [weakSelf printPrettyPrintedMoveOverEventMessageJsonStringWithJsonObject:messageDic];
        //测试查看 weakSelf 是不是为空
        NSLog(@"weakSelf is %@",weakSelf);
        
        //测试查看 self 是不是为空
        NSLog(@"self is %@",self);
        
        //测试查看 weakSelf 是不是为空
        NSLog(@"再次查看 weakSelf is %@",weakSelf);

    }];
    
    //在 didReceiveScriptMessage 代理方法中获得点击 X轴的文字🏷标签的回调
    [_aaChartView didReceiveScriptMessageHandler:^(AAChartView *aaChartView, WKScriptMessage *message) {
        NSLog(@"Clicked X axis label,  name is %@", message.body);
    }];
}

- (NSMutableDictionary *)eventMessageModelWithMessageBody:(AAEventMessageModel *)eventMessageModel {
    NSMutableDictionary *messageBody = [NSMutableDictionary dictionary];
    messageBody[@"name"] = eventMessageModel.name;
    messageBody[@"x"] = eventMessageModel.x;
    messageBody[@"y"] = eventMessageModel.y;
    messageBody[@"category"] = eventMessageModel.category;
    messageBody[@"offset"] = eventMessageModel.offset;
    messageBody[@"index"] = @(eventMessageModel.index);
    return messageBody;
}


- (NSString*)printPrettyPrintedClickEventMessageJsonStringWithJsonObject:(id)jsonObject {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *jsonStr =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *logPrefix = @"🖱🖱🖱🖱  user finger clicked!!!,get the clicked event series element message:";
    NSString *eventMessage = [NSString stringWithFormat:@"%@ \n %@",
                              logPrefix,
                              jsonStr];
    NSLog(@"%@",eventMessage);
    
    if (error) {
        NSLog(@"❌❌❌ pretty printed JSONString with JSONObject serialization failed：%@", error);
        return nil;
    }
    return jsonStr;
}

- (NSString*)printPrettyPrintedMoveOverEventMessageJsonStringWithJsonObject:(id)jsonObject {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *jsonStr =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *logPrefix = @"👌👌👌👌  user finger moved over!!!,get the move over event series element message:";
    NSString *eventMessage = [NSString stringWithFormat:@"%@ \n %@",
                              logPrefix,
                              jsonStr];
    NSLog(@"%@",eventMessage);
    
    if (error) {
        NSLog(@"❌❌❌ pretty printed JSONString with JSONObject serialization failed：%@", error);
        return nil;
    }
    return jsonStr;
}

- (id)jsonObjectWithJsonString:(NSString *)string {
    if (string && 0 != string.length) {
        NSError *error;
        NSData *jsonData = [string dataUsingEncoding:NSUTF8StringEncoding];
        id jsonObjet = [NSJSONSerialization JSONObjectWithData:jsonData
                                                       options:NSJSONReadingMutableContainers
                                                         error:&error];
        if (error) {
            NSLog(@"❌❌❌ JSONObject with JSONString serialization failed：%@", error);
            return nil;
        }
        return jsonObjet;
    }
    return nil;
}


@end
