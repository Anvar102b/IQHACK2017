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
    [super awakeFromNib];
    self.chart = [[CumSumBarView alloc]initWithFrame:self.bounds];
    self.chart.colorAry = @[[UIColor orangeColor], [UIColor yellowColor], [UIColor redColor], [UIColor blueColor], [UIColor purpleColor]];
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
