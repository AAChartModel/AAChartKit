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

@end

@implementation AABaseListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"AAChartKit";
    self.view.backgroundColor = UIColor.whiteColor;
    
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
    tableView.backgroundColor = UIColor.whiteColor;
    tableView.sectionHeaderHeight = 45;
    tableView.sectionIndexColor = UIColor.redColor;
    [tableView registerNib:[UINib nibWithNibName:kCustomTableViewCell bundle:NSBundle.mainBundle] forCellReuseIdentifier:kCustomTableViewCell];
    [self.view addSubview:tableView];
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
    UIView *sectionHeaderView = [[UIView alloc] init];
    UIColor *bgColor = [self kColorWithHexString:self.colorsArr[section % 18]];
    sectionHeaderView.backgroundColor = bgColor;
    
    UILabel *sectionTitleLabel = [[UILabel alloc] initWithFrame:sectionHeaderView.bounds];
    sectionTitleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    sectionTitleLabel.text = self.sectionTitleArr[section];
    sectionTitleLabel.textColor = UIColor.whiteColor;
    sectionTitleLabel.font = [UIFont boldSystemFontOfSize:17];
    sectionTitleLabel.textAlignment = NSTextAlignmentCenter;
    [sectionHeaderView addSubview:sectionTitleLabel];
    
    return sectionHeaderView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCustomTableViewCell];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = UIColor.whiteColor;
    } else {
        cell.backgroundColor = [self kRGBColorFromHex:0xE6E6FA];
    }
    
    NSString *cellTitle = self.chartTypeTitleArr[indexPath.section][indexPath.row];
    cell.titleLabel.text = cellTitle;
    cell.titleLabel.textColor = UIColor.blackColor;
    cell.numberLabel.text = [NSString stringWithFormat:@"%ld", (long)(indexPath.row + 1)];
    
    UIColor *bgColor = [self kColorWithHexString:self.colorsArr[indexPath.section % 18]];
    cell.numberLabel.backgroundColor = bgColor;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Implement selection logic here
}

@end

