//
//  ChartAnimationTypeVC.m
//  AAChartKit
//
//  Created by An An on 2017/7/6.
//  Copyright © 2017年 Danny boy. All rights reserved.
//

#import "ChartAnimationTypeVC.h"
//当前屏幕的宽高
#define CurrentHeight ([UIScreen mainScreen].bounds.size.height)
#define CurrentWidth ([UIScreen mainScreen].bounds.size.width)

@interface ChartAnimationTypeVC () {
    UIButton *_lastClickedButton;
}

@end

@implementation ChartAnimationTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureTheButtons];
 

}

- (void)configureTheButtons{
    NSArray *chartAnimationTypeArr = @[
                                       @"linear",
                                       @"swing",
                                       @"easeInQuad",
                                       @"easeInOutQuad",
                                       @"easeInCubic",
                                       @"easeOutCubic",
                                       @"easeInOutCubic",
                                       @"easeInQuart",
                                       @"easeOutQuart",
                                       @"easeInOutQuart",
                                       @"easeInQuint",
                                       @"easeOutQuint",
                                       @"easeInOutQuint",
                                       @"easeInExpo",
                                       @"easeOutExpo",
                                       @"easeInOutExpo",
                                       @"easeInSine",
                                       @"easeOutSine",
                                       @"easeInOutSine",
                                       @"easeInCirc",
                                       @"easeOutCirc",
                                       @"easeInOutCirc",
                                       @"easeInElastic",
                                       @"easeOutElastic",
                                       @"easeInOutElastic",
                                       @"easeInBack",
                                       @"easeOutBack",
                                       @"easeInOutBack",
                                       @"easeInBounce",
                                       @"easeOutBounce",
                                       @"easeInOutBounce",
                                       ];
    
    CGRect myRect = CGRectMake(15, 17, 3, 20);
    
    float butX = 15;
    float butY = CGRectGetMaxY(myRect)+10;
    for(int i = 0; i < chartAnimationTypeArr.count; i++){
        NSDictionary *fontDict = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        CGRect frame_W = [chartAnimationTypeArr[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDict context:nil];
        if (butX+frame_W.size.width+20>CurrentWidth-15) {
            butX = 13;
            butY += 40;
        }
        
        UIButton *but = [[UIButton alloc]initWithFrame:CGRectMake(butX, butY, frame_W.size.width+20, 25)];
        [but setTitle:chartAnimationTypeArr[i] forState:UIControlStateNormal];
        [but setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        but.titleLabel.font = [UIFont systemFontOfSize:13];
        but.layer.cornerRadius = 5;
        but.layer.borderColor = [UIColor lightGrayColor].CGColor;
        but.layer.borderWidth = 1;
        [but addTarget:self action:@selector(myAnimationTypeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:but];
        
        butX = CGRectGetMaxX(but.frame)+10;
    }

}

- (void)myAnimationTypeButtonClicked:(UIButton *)sender {
    _lastClickedButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _lastClickedButton.backgroundColor = [UIColor whiteColor];
    [_lastClickedButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    
    
    sender.layer.borderColor = [[UIColor blueColor] CGColor];
    sender.backgroundColor = [UIColor blueColor];
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _lastClickedButton = sender;

}



@end
