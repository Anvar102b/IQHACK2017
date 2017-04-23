//
//  SecondChartView.m
//  IQOptionHack
//
//  Created by Динар Габдуллин on 23.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import "SecondChartView.h"
#import "CumSumBarView.h"

@interface SecondChartView ()

@property (nonatomic, strong) CumSumBarView *chart;

@end

@implementation SecondChartView

- (void)awakeFromNib {
    UIColor *firstColor = [UIColor colorWithRed:0.99 green:0.44 blue:0.13 alpha:1.f];
    UIColor *secondColor = [UIColor colorWithRed:1.00 green:0.53 blue:0.13 alpha:1.f];
    UIColor *thirdColor = [UIColor colorWithRed:0.99 green:0.68 blue:0.37 alpha:1.f];
    UIColor *fourthColor = [UIColor colorWithRed:0.99 green:0.75 blue:0.54 alpha:1.f];
    UIColor *fifhtColor = [UIColor colorWithRed:0.54 green:0.83 blue:0.31 alpha:1.f];
    
    [super awakeFromNib];
    self.chart = [[CumSumBarView alloc]initWithFrame:self.bounds];
    self.chart.colorAry = @[firstColor, secondColor, thirdColor, fourthColor, fifhtColor];
    self.chart.dataArys = @[@[@0, @0, @0, @0, @60],
                            @[@0, @0, @0, @50, @0],
                            @[@0, @0, @40, @0, @0],
                            @[@0, @30, @0, @0, @0],
                            @[@18, @0, @0, @0, @0]];
    self.chart.titleAry = @[@"18%", @"30%", @"40%", @"50%", @"60%"];
    [self.chart stockChart];
    [self.chart addAnimation];
    [self addSubview:self.chart];
}

@end
