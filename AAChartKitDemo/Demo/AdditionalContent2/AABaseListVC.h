//
//  AABaseListVC.h
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/4.
//  Copyright © 2024 An An. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AABaseListVC : UIViewController

@property (nonatomic, strong) NSArray<NSString *> *sectionTitleArr;
@property (nonatomic, strong) NSArray<NSArray<NSString *> *> *chartTypeTitleArr;

- (void)setUpMainTableView;

@end

NS_ASSUME_NONNULL_END
