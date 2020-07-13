//
//  AlgorithmVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2019/6/3.
//  Copyright © 2019 Danny boy. All rights reserved.
//

#import "AlgorithmVC.h"
#import "AAChartKit.h"

@interface AlgorithmVC ()<AAChartViewEventDelegate>

@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;
@end

@implementation AlgorithmVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.aaChartView = [self setUpAAChartView];
    self.aaChartView.delegate = self;
    self.aaChartModel = [self setUpAAChartModel];
    [self.aaChartView aa_drawChartWithChartModel:self.aaChartModel];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        AASeriesElement *element = self.aaChartModel.series[0];
        NSArray *dataArr = element.data;
        [self bubbleSortWithDataArray:dataArr];
    });
    
   
    
 
}

- (AAChartView *)setUpAAChartView {
    CGRect chartViewFrame = CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88);
    AAChartView *aaChartView = [[AAChartView alloc]initWithFrame:chartViewFrame];
    aaChartView.scrollEnabled = NO;
    [self.view addSubview:aaChartView];
    return aaChartView;
}

- (AAChartModel *)setUpAAChartModel {
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)
    .dataLabelsEnabledSet(true)//是否显示值
    .tooltipEnabledSet(true)
    ;
    
    //
    
//    NSArray *dataArr = @[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6];
    
//    NSMutableArray *attributedDataArr = [NSMutableArray array];
//    [dataArr enumerateObjectsUsingBlock:^(NSNumber *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        AADataElement *dataElement = AADataElement.new;
//        dataElement.y = obj;
//        dataElement.color = AAColor.grayColor;
//        [attributedDataArr addObject:dataElement];
//    }];
    
    NSArray *seriesArr = @[
                           AASeriesElement.new
                           .nameSet(@"所有专业")
                           .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6])
                           ];
    
    aaChartModel.series = seriesArr;
    
    return aaChartModel;
}

- (void)aaChartViewDidFinishLoad:(AAChartView *)aaChartView {
    

}


- (void)bubbleSortWithDataArray:(NSArray *)dataArr {
    NSMutableArray *result = [NSMutableArray arrayWithArray:dataArr];
    
    
    
    for (int i = 0; i<result.count-1; i++) {
        for (int j = 0; j<result.count-1-i; j++) {
            NSInteger left = [result[j] integerValue];
            NSInteger right = [result[j+1] integerValue];
            if (left<right) {
                [result exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }

            NSLog(@"循环执行了多少次%@",result);
//            AASeriesElement *element = AASeriesElement.new
//            .nameSet(@"所有专业")
//            .dataSet(result);
//            NSArray *seriesArr = @[[AAJsonConverter getObjectData:element]];
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [self.aaChartView aa_onlyRefreshTheChartDataWithChartModelSeries:seriesArr];
//                NSLog(@"%@",result);
//            });
          
            [NSThread sleepForTimeInterval:3];

        }
        
       
    }
    NSLog(@"%@",result);

}


- (void)bubbleSortWithArray:(NSArray *)array {
    
    
    
    
    NSMutableArray *attributedDataArr = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(NSNumber *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        AADataElement *dataElement = AADataElement.new;
        dataElement.y = obj;
        dataElement.color = AAColor.grayColor;
        [attributedDataArr addObject:dataElement];
    }];
    
    NSMutableArray *attributedDataArr2 = [NSMutableArray array];

    
    NSInteger len = array.count;
    for (int i = 0; i < len - 1; i++) {
       
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            for (int j = 0; j < len - 1 - i; j++) {
                AADataElement *jData = attributedDataArr[j];
                AADataElement *jPlus1Data =  attributedDataArr[j+1];
                
                if (jData.y > jPlus1Data.y) {       // 相邻元素两两对比
                    AADataElement * temp = attributedDataArr[j+1];       // 元素交换
                    attributedDataArr[j+1] = attributedDataArr[j];
                    attributedDataArr[j] = temp;
                }
            }
            
            [attributedDataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                AADataElement *element = obj;
//               NSDictionary *elementDic = [AAJsonConverter getObjectData:element];
//                attributedDataArr2[idx] = elementDic;
            }];
            
            AASeriesElement *seriesElemnt =  AASeriesElement.new
            .nameSet(@"所有专业")
            .dataSet(attributedDataArr2);
            
            NSArray *seriesDicArr = @[
//                                      [AAJsonConverter getObjectData:seriesElemnt]
                                      ];
            NSLog(@"%@",seriesDicArr);
        
        self.aaChartModel.series = @[
                                     seriesElemnt
                                     ];
        
//            [self.aaChartView aa_onlyRefreshTheChartDataWithChartModelSeries:seriesDicArr];
         NSLog(@"111111111111刷新了几次%d",i);
        [self.aaChartView aa_refreshChartWithChartModel:self.aaChartModel];
         NSLog(@"2222222222222刷新了几次%d",i);
        });
        
        
    }
}


@end
