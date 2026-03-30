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
    
    // Number badge — pill shape
    self.numberLabel.layer.masksToBounds = YES;
    self.numberLabel.layer.cornerRadius = 10;
    self.numberLabel.font = [UIFont monospacedDigitSystemFontOfSize:11 weight:UIFontWeightSemibold];
    self.numberLabel.textColor = UIColor.whiteColor;
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    
    // Title typography
    self.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
    
    // Subtitle — lighter, smaller for visual hierarchy
    self.subtitleLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    
    // Dynamic text colors
    if (@available(iOS 13.0, *)) {
        self.titleLabel.textColor = UIColor.labelColor;
        self.subtitleLabel.textColor = UIColor.tertiaryLabelColor;
    }
}

// Preserve numberLabel background during selection/highlight
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    UIColor *savedColor = self.numberLabel.backgroundColor;
    [super setSelected:selected animated:animated];
    self.numberLabel.backgroundColor = savedColor;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    UIColor *savedColor = self.numberLabel.backgroundColor;
    [super setHighlighted:highlighted animated:animated];
    self.numberLabel.backgroundColor = savedColor;
}

@end
