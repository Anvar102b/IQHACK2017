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

- (void)awakeFromNib {
    [super awakeFromNib];
    const UIColor *greenColor = [UIColor colorWithRed:248.f/255.f green:234.f/255.f blue:194.f/255.f alpha:1.f];
    const UIColor *yellowColor = [UIColor colorWithRed:70.f/255.f green:209/255.f blue:211.f/255.f alpha:1.f];
    
    self.frame = self.bounds;
    self.colorAry = @[greenColor, yellowColor];
   // [self addSubview:lineView];
}

- (void)updateChartWithMonthCount:(NSArray*)monthsArray cleanCash:(NSArray*)cleanCash investCash:(NSArray*)investCash {

    self.dataArys =  @[monthsArray,cleanCash];
    
    NSMutableArray* titleArray = [NSMutableArray array];
    
    for (NSNumber* month in monthsArray) {
        NSString* mStr = [NSString stringWithFormat:@"%ld", (long)month.integerValue];
        [titleArray addObject:mStr];
    }
    self.titleAry = titleArray;
    [self stockChart];
    
}


@end
