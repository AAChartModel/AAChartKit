//
//  AAOptionsComposerChartListVC.m
//  AAChartKitDemo
//

#import "AAOptionsComposerChartListVC.h"
#import "AAChartKit.h"
#import "AAOptionsComposerProvider.h"

static NSString * const kAAOptionsComposerChartCellId = @"AAOptionsComposerChartCell";

@interface AAOptionsComposerChartCell : UITableViewCell

@property (nonatomic, strong, readonly) AAChartView *aaChartView;

@end

@implementation AAOptionsComposerChartCell {
    AAChartView *_aaChartView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        if (@available(iOS 13.0, *)) {
            self.backgroundColor = UIColor.systemBackgroundColor;
        } else {
            self.backgroundColor = UIColor.whiteColor;
        }

        _aaChartView = [[AAChartView alloc] initWithFrame:CGRectZero];
        _aaChartView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_aaChartView];

        [NSLayoutConstraint activateConstraints:@[
            [_aaChartView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor],
            [_aaChartView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
            [_aaChartView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
            [_aaChartView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor],
        ]];
    }
    return self;
}

- (AAChartView *)aaChartView {
    return _aaChartView;
}

@end

@interface AAOptionsComposerChartListVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray<AAOptions *> *optionsItems;

@end

@implementation AAOptionsComposerChartListVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"AAOptions Composer List";
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = UIColor.systemBackgroundColor;
    } else {
        self.view.backgroundColor = UIColor.whiteColor;
    }

    self.optionsItems = [AAOptionsComposerProvider aaOptionsComposerItems];
    [self setUpTableView];
}

- (void)setUpTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (@available(iOS 13.0, *)) {
        self.tableView.backgroundColor = UIColor.systemBackgroundColor;
    } else {
        self.tableView.backgroundColor = UIColor.whiteColor;
    }
    [self.tableView registerClass:[AAOptionsComposerChartCell class] forCellReuseIdentifier:kAAOptionsComposerChartCellId];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.optionsItems.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AAOptionsComposerChartCell *cell = [tableView dequeueReusableCellWithIdentifier:kAAOptionsComposerChartCellId forIndexPath:indexPath];
    AAOptions *aaOptions = self.optionsItems[(NSUInteger)indexPath.row];
    [cell.aaChartView aa_drawChartWithOptions:aaOptions];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 340;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

@end
