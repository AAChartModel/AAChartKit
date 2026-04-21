//
//  CustomTableViewCell.h
//  AAChartKitDemo
//
//  Created by AnAn on 2022/9/9.
//  Copyright © 2022 An An. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@property (nonatomic, strong) UIColor *sectionColor;

@end

NS_ASSUME_NONNULL_END
