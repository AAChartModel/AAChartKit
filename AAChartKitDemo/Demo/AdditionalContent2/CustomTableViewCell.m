//
//  CustomTableViewCell.m
//  AAChartKitDemo
//
//  Created by AnAn on 2022/9/9.
//  Copyright © 2022 An An. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    if (@available(iOS 13.0, *)) {
        self.titleLabel.textColor = UIColor.labelColor;
        self.subtitleLabel.textColor = UIColor.secondaryLabelColor;
        self.numberLabel.textColor = UIColor.whiteColor;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
