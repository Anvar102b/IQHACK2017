//
//  ChartView.m
//  IQOptionHack
//
//  Created by Динар Габдуллин on 22.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import "CumSumLineView.h"
#import "ChartView.h"

@implementation ChartView

- (instancetype)init {
    self = [super init];
    if (self) {
        const UIColor *greenColor = [UIColor colorWithRed:248.f/255.f green:234.f/255.f blue:194.f/255.f alpha:1.f];
        const UIColor *yellowColor = [UIColor colorWithRed:70.f/255.f green:209/255.f blue:211.f/255.f alpha:1.f];
        
        CumSumLineView *lineView = [[CumSumLineView alloc]initWithFrame:self.bounds];
        lineView.colorAry = @[greenColor, yellowColor];
        lineView.dataArys = @[@[@320, @202, @301, @334, @390, @330, @320],
                              @[@120, @132, @101, @134, @90, @230, @210]];
        lineView.titleAry = @[@"周一", @"周二", @"周三", @"周四", @"周五", @"周六", @"周日"];
        [lineView stockChart];
        [self addSubview:lineView];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    const UIColor *greenColor = [UIColor colorWithRed:248.f/255.f green:234.f/255.f blue:194.f/255.f alpha:1.f];
    const UIColor *yellowColor = [UIColor colorWithRed:70.f/255.f green:209/255.f blue:211.f/255.f alpha:1.f];
    
    CumSumLineView *lineView = [[CumSumLineView alloc]initWithFrame:self.bounds];
    lineView.colorAry = @[greenColor, yellowColor];
    lineView.dataArys = @[@[@320, @202, @301, @334, @390, @330, @320],
                          @[@120, @132, @101, @134, @90, @230, @210]];
    lineView.titleAry = @[@"周一", @"周二", @"周三", @"周四", @"周五", @"周六", @"周日"];
    [lineView stockChart];
    [self addSubview:lineView];
}

@end
