//
//  AABaseListVC.m
//  AAChartKitDemo
//
//  Created by AnAn on 2024/9/4.
//  Copyright © 2024 An An. All rights reserved.
//

#import "AABaseListVC.h"
#import "CustomTableViewCell.h"

NSString *const kCustomTableViewCell = @"CustomTableViewCell";

@interface AABaseListVC () <UITableViewDelegate, UITableViewDataSource>

//@property (nonatomic, strong) NSArray<NSString *> *sectionTitleArr;
//@property (nonatomic, strong) NSArray<NSArray<NSString *> *> *chartTypeTitleArr;
@property (nonatomic, strong) NSArray<NSArray *> *chartTypeArr;
@property (nonatomic, strong) NSArray<NSString *> *colorsArr;
@property (nonatomic, strong) UITableView *mainTableView;

@end

@implementation AABaseListVC

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.title.length == 0) {
        self.title = @"AAChartKit";
    }
    
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = UIColor.systemGroupedBackgroundColor;
    } else {
        self.view.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:247/255.0 alpha:1.0];
    }
    
    self.colorsArr = @[
        @"#5470c6", @"#91cc75", @"#fac858", @"#ee6666",
        @"#73c0de", @"#3ba272", @"#fc8452", @"#9a60b4",
        @"#ea7ccc", @"#5470c6", @"#91cc75", @"#fac858",
        @"#ee6666", @"#73c0de", @"#3ba272", @"#fc8452",
        @"#9a60b4", @"#ea7ccc"
    ];
    
    // Uncomment the following lines if needed
    // self.sectionTitleArr = @[];
    // self.chartTypeTitleArr = @[];
    // self.chartTypeArr = @[];
    
    // Uncomment the following line if needed
    // [self setUpMainTableView];
}

- (void)setUpMainTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.delegate = self;
    tableView.dataSource = self;
    if (@available(iOS 13.0, *)) {
        tableView.backgroundColor = UIColor.systemGroupedBackgroundColor;
    } else {
        tableView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:247/255.0 alpha:1.0];
    }
    tableView.sectionHeaderHeight = 56;
    tableView.estimatedRowHeight = 92;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.separatorInset = UIEdgeInsetsMake(0, 48, 0, 0);
    if (@available(iOS 13.0, *)) {
        tableView.separatorColor = UIColor.separatorColor;
    }
    tableView.sectionIndexColor = UIColor.redColor;
    [tableView registerNib:[UINib nibWithNibName:kCustomTableViewCell bundle:NSBundle.mainBundle] forCellReuseIdentifier:kCustomTableViewCell];
    [self.view addSubview:tableView];
    self.mainTableView = tableView;
}

- (UIColor *)kRGBColorFromHex:(int)rgbValue {
    return [UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0
                           green:((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0
                            blue:((CGFloat)(rgbValue & 0xFF)) / 255.0
                           alpha:1.0];
}

- (UIColor *)kColorWithHexString:(NSString *)hexString {
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    
    if ([cString length] != 6) {
        return UIColor.grayColor;
    }
    
    NSString *rString = [cString substringToIndex:2];
    NSString *gString = [[cString substringFromIndex:2] substringToIndex:2];
    NSString *bString = [[cString substringFromIndex:4] substringToIndex:2];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((CGFloat)r / 255.0)
                           green:((CGFloat)g / 255.0)
                            blue:((CGFloat)b / 255.0)
                           alpha:1.0];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.chartTypeTitleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.chartTypeTitleArr[section].count;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray<NSString *> *listTitles = [NSMutableArray array];
    for (NSString *item in self.sectionTitleArr) {
        NSString *titleStr = [item substringToIndex:1];
        [listTitles addObject:titleStr];
    }
    return listTitles;
}

#pragma mark - UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIColor *baseColor = [self kColorWithHexString:self.colorsArr[section % 18]];
    CGFloat tableW = tableView.bounds.size.width;
    
    // Transparent container
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableW, 56)];
    container.backgroundColor = UIColor.clearColor;
    
    // Floating card
    CGFloat margin = 12;
    UIView *card = [[UIView alloc] initWithFrame:CGRectMake(margin, 4, tableW - margin * 2, 48)];
    card.layer.cornerRadius = 12;
    card.clipsToBounds = NO;
    
    // Diagonal gradient
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = card.bounds;
    gradient.cornerRadius = 12;
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint   = CGPointMake(1, 1);
    UIColor *lighterColor = [self aa_lightenColor:baseColor byAmount:0.12];
    gradient.colors = @[(id)baseColor.CGColor, (id)lighterColor.CGColor];
    [card.layer insertSublayer:gradient atIndex:0];
    
    // Colored shadow
    card.layer.shadowColor   = baseColor.CGColor;
    card.layer.shadowOffset  = CGSizeMake(0, 3);
    card.layer.shadowRadius  = 6;
    card.layer.shadowOpacity = 0.35;
    
    // Decorative translucent circles
    CGFloat cardW = card.bounds.size.width;
    CGFloat cardH = card.bounds.size.height;
    
    CAShapeLayer *circle1 = [CAShapeLayer layer];
    circle1.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(cardW - 60, -10, 50, 50)].CGPath;
    circle1.fillColor = [UIColor colorWithWhite:1.0 alpha:0.08].CGColor;
    [card.layer addSublayer:circle1];
    
    CAShapeLayer *circle2 = [CAShapeLayer layer];
    circle2.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(cardW - 35, cardH - 30, 40, 40)].CGPath;
    circle2.fillColor = [UIColor colorWithWhite:1.0 alpha:0.06].CGColor;
    [card.layer addSublayer:circle2];
    
    // Section number badge
    UILabel *badge = [[UILabel alloc] initWithFrame:CGRectMake(14, (cardH - 24) / 2, 24, 24)];
    badge.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.25];
    badge.layer.cornerRadius = 12;
    badge.layer.masksToBounds = YES;
    badge.text = [NSString stringWithFormat:@"%ld", (long)(section + 1)];
    badge.textColor = UIColor.whiteColor;
    badge.font = [UIFont monospacedDigitSystemFontOfSize:11 weight:UIFontWeightBold];
    badge.textAlignment = NSTextAlignmentCenter;
    [card addSubview:badge];
    
    // Title label
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(46, 0, cardW - 70, cardH)];
    titleLabel.text = self.sectionTitleArr[section];
    titleLabel.textColor = UIColor.whiteColor;
    titleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    titleLabel.numberOfLines = 1;
    [card addSubview:titleLabel];
    
    [container addSubview:card];
    return container;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCustomTableViewCell];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UIColor *themeColor = [self kColorWithHexString:self.colorsArr[indexPath.section % 18]];
    cell.sectionColor = themeColor;
    cell.numberLabel.text = [NSString stringWithFormat:@"%ld", (long)(indexPath.row + 1)];
    
    NSString *cellTitle = self.chartTypeTitleArr[indexPath.section][indexPath.row];
    NSArray<NSString *> *titleParts = [cellTitle componentsSeparatedByString:@"---"];
    cell.titleLabel.text = titleParts.firstObject;
    cell.subtitleLabel.text = titleParts.count > 1 ? titleParts[1] : @"";
    
    if (@available(iOS 13.0, *)) {
        cell.backgroundColor = UIColor.secondarySystemGroupedBackgroundColor;
    } else {
        cell.backgroundColor = UIColor.whiteColor;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Dark Mode Support

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            [self aa_updateDynamicColors];
        }
    }
}

- (void)aa_updateDynamicColors {
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = UIColor.systemGroupedBackgroundColor;
        self.mainTableView.backgroundColor = UIColor.systemGroupedBackgroundColor;
        [self.mainTableView reloadData];
    }
}

#pragma mark - Color Helpers

- (UIColor *)aa_lightenColor:(UIColor *)color byAmount:(CGFloat)amount {
    CGFloat r, g, b, a;
    [color getRed:&r green:&g blue:&b alpha:&a];
    return [UIColor colorWithRed:MIN(r + amount, 1.0)
                           green:MIN(g + amount, 1.0)
                            blue:MIN(b + amount, 1.0)
                           alpha:a];
}

@end

