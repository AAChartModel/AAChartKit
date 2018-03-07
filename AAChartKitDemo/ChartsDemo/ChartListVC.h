//
//  ChartListVC.h
//  AAChartKitDemo
//
//  Created by AnAn on 2018/3/7.
//  Copyright © 2018年 Danny boy. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "AAChartView.h"


@interface ChartListVC : UIViewController

@end



#import "AAChartView.h"

@interface ChartListCell : UITableViewCell

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) AAChartView *aaChartView;

@end
