//
//  CustomTableViewCell.m
//  AAChartKitDemo
//
//  Created by AnAn on 2022/9/9.
//  Copyright © 2022 An An. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell ()

@property (nonatomic, strong) UIView *accentBarView;
@property (nonatomic, strong) CAGradientLayer *badgeGradient;

@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // ── Left accent bar ──
    self.accentBarView = [[UIView alloc] init];
    self.accentBarView.layer.cornerRadius = 1.75;
    self.accentBarView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.accentBarView];
    
    // ── Number badge ──
    self.numberLabel.layer.cornerRadius = 10;
    self.numberLabel.layer.masksToBounds = YES;
    self.numberLabel.font = [UIFont monospacedDigitSystemFontOfSize:11 weight:UIFontWeightBold];
    self.numberLabel.textColor = UIColor.whiteColor;
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    
    // Diagonal gradient on badge
    self.badgeGradient = [CAGradientLayer layer];
    self.badgeGradient.cornerRadius = 10;
    self.badgeGradient.startPoint = CGPointMake(0, 0);
    self.badgeGradient.endPoint = CGPointMake(1, 1);
    [self.numberLabel.layer insertSublayer:self.badgeGradient atIndex:0];
    
    // ── Title typography ──
    self.titleLabel.font = [UIFont systemFontOfSize:15.5 weight:UIFontWeightSemibold];
    
    // ── Subtitle typography ──
    self.subtitleLabel.font = [UIFont systemFontOfSize:12.5 weight:UIFontWeightRegular];
    
    // ── Dynamic colors ──
    if (@available(iOS 13.0, *)) {
        self.titleLabel.textColor = UIColor.labelColor;
        self.subtitleLabel.textColor = UIColor.secondaryLabelColor;
    } else {
        self.titleLabel.textColor = [UIColor colorWithWhite:0.12 alpha:1.0];
        self.subtitleLabel.textColor = [UIColor colorWithWhite:0.50 alpha:1.0];
    }
    
    // ── Custom selection highlight ──
    UIView *selectedBg = [[UIView alloc] init];
    if (@available(iOS 13.0, *)) {
        selectedBg.backgroundColor = [UIColor.systemGray4Color colorWithAlphaComponent:0.28];
    } else {
        selectedBg.backgroundColor = [UIColor colorWithWhite:0.92 alpha:1.0];
    }
    self.selectedBackgroundView = selectedBg;
}

#pragma mark - Section Color

- (void)setSectionColor:(UIColor *)sectionColor {
    _sectionColor = sectionColor;
    
    self.accentBarView.backgroundColor = sectionColor;
    
    // Badge: base → slightly lighter diagonal gradient
    CGFloat r, g, b, a;
    [sectionColor getRed:&r green:&g blue:&b alpha:&a];
    UIColor *lighter = [UIColor colorWithRed:MIN(r + 0.10, 1.0)
                                       green:MIN(g + 0.10, 1.0)
                                        blue:MIN(b + 0.10, 1.0)
                                       alpha:a];
    self.badgeGradient.colors = @[(id)sectionColor.CGColor, (id)lighter.CGColor];
}

#pragma mark - Layout

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // Accent bar: thin strip, 55% of cell height, vertically centered
    CGFloat barW = 3.5;
    CGFloat barH = self.contentView.bounds.size.height * 0.55;
    CGFloat barY = (self.contentView.bounds.size.height - barH) / 2.0;
    self.accentBarView.frame = CGRectMake(2.5, barY, barW, barH);
    
    // Badge gradient must match label bounds
    self.badgeGradient.frame = self.numberLabel.bounds;
}

#pragma mark - Preserve Colors During Selection / Highlight

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    UIColor *badgeColor  = self.numberLabel.backgroundColor;
    UIColor *accentColor = self.accentBarView.backgroundColor;
    [super setSelected:selected animated:animated];
    self.numberLabel.backgroundColor  = badgeColor;
    self.accentBarView.backgroundColor = accentColor;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    UIColor *badgeColor  = self.numberLabel.backgroundColor;
    UIColor *accentColor = self.accentBarView.backgroundColor;
    [super setHighlighted:highlighted animated:animated];
    self.numberLabel.backgroundColor  = badgeColor;
    self.accentBarView.backgroundColor = accentColor;
}

@end
