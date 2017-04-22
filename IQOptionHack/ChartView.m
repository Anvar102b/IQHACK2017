//
//  ChartView.m
//  IQOptionHack
//
//  Created by Динар Габдуллин on 22.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import "CumSumLineView.h"
#import "ChartView.h"

@interface ChartView ()

@property (nonatomic, strong) CumSumLineView* layView;
@property (nonatomic, strong) CumSumLineView* layView2;


@end

@implementation ChartView

- (void)awakeFromNib {
    [super awakeFromNib];
    const UIColor *greenColor = [UIColor colorWithRed:248.f/255.f green:234.f/255.f blue:194.f/255.f alpha:1.f];
    const UIColor *yellowColor = [UIColor colorWithRed:70.f/255.f green:209/255.f blue:211.f/255.f alpha:1.f];
    
    
    
    //self.frame = self.bounds;
    
   // [self addSubview:lineView];
    
    self.layView = [[CumSumLineView alloc] initWithFrame:CGRectZero];
    self.layView.colorAry = @[[UIColor colorWithRed:0.27 green:0.82 blue:0.44 alpha:1.00]];
    self.layView.frame =  self.bounds;
    
    [self addSubview:self.layView];
    
    self.layView2 = [[CumSumLineView alloc] initWithFrame:CGRectZero];
    self.layView2.colorAry = @[[UIColor colorWithRed:0.96 green:0.76 blue:0.19 alpha:1.00]];
    self.layView2.frame =  self.bounds;
    
    [self addSubview:self.layView2];
    
    
}

- (void)updateChartWithMonthCount:(NSArray*)monthsArray cleanCash:(NSArray*)cleanCash investCash:(NSArray*)investCash {

    self.layView.dataArys =  @[investCash];
    
    NSMutableArray* titleArray = [NSMutableArray array];
    
    for (NSNumber* month in monthsArray) {
        NSString* mStr = [NSString stringWithFormat:@"%ld", (long)month.integerValue];
        [titleArray addObject:mStr];
    }
    self.layView.titleAry = titleArray;
    [self.layView stockChart1];
 //   [self.layView addAnimation];
    
    _layView2.dataArys =  @[cleanCash];
    _layView2.titleAry = titleArray;
    [_layView2 stockChart1];
 //   [_layView2 addAnimation];
    [self addSubview:_layView2];
    
}


@end
