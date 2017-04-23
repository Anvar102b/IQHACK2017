//
//  ChartView.m
//  IQOptionHack
//
//  Created by Динар Габдуллин on 22.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import "CumSumLineView.h"
#import "ChartView.h"
#import "Chart2View.h"
#import "Chart3View.h"

@interface ChartView ()

@property (nonatomic, strong) CumSumLineView* layView;
@property (nonatomic, strong) Chart2View* layView2;
@property (nonatomic, strong) Chart3View* layView3;

@end

@implementation ChartView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layView = [[CumSumLineView alloc] initWithFrame:CGRectZero];
    self.layView.colorAry = @[[UIColor colorWithRed:0.07 green:0.76 blue:0.81 alpha:1.00]]; //голубой
    self.layView.frame =  self.bounds;
    [self addSubview:self.layView];
    
    self.layView2 = [[Chart2View alloc] initWithFrame:CGRectZero];
    self.layView2.colorAry = @[[UIColor colorWithRed:0.27 green:0.82 blue:0.44 alpha:1.00]];// зеленый
    self.layView2.frame =  self.bounds;
    [self addSubview:self.layView2];
    
    self.layView3 = [[Chart3View alloc] initWithFrame:CGRectZero];
    self.layView3.colorAry = @[[UIColor colorWithRed:0.98 green:0.64 blue:0.24 alpha:1.00]]; // оранж
    self.layView3.frame =  self.bounds;
    [self addSubview:self.layView3];
 
    
}

- (void)updateChartWithMonthCount:(NSArray*)monthsArray cleanCash:(NSArray*)cleanCash investCash:(NSArray*)investCash {

    self.layView.dataArys =  @[investCash];
    
    NSMutableArray* titleArray = [NSMutableArray array];
    for (NSNumber* month in monthsArray) {
        NSString* mStr = [NSString stringWithFormat:@"%ld", (long)month.integerValue];
        [titleArray addObject:mStr];
    }
    self.layView.titleAry = titleArray;
    [self.layView stockChart];
    
}

- (void)updateChartWithMonthCount2:(NSArray*)monthsArray2 investCash:(NSArray*)investCash2 {
    self.layView2.dataArys =  @[investCash2];
    
    NSMutableArray* titleArray = [NSMutableArray array];
    for (NSNumber* month in monthsArray2) {
        NSString* mStr = @"";
        [titleArray addObject:mStr];
    }
    self.layView2.titleAry = titleArray;
    [self.layView2 stockChart2];
}

- (void)updateChartWithMonthCount3:(NSArray*)monthsArray3 investCash:(NSArray*)investCash3 {
    self.layView3.dataArys =  @[investCash3];
    
    NSMutableArray* titleArray = [NSMutableArray array];
    for (NSNumber* month in monthsArray3) {
        NSString* mStr = @"";
        [titleArray addObject:mStr];
    }
    self.layView3.titleAry = titleArray;
    [self.layView3 stockChart3];
    
}




@end
