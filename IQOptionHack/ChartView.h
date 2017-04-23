//
//  ChartView.h
//  IQOptionHack
//
//  Created by Динар Габдуллин on 22.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CumSumLineView.h"

@interface ChartView : UIView

- (void)updateChartWithMonthCount:(NSArray*)monthsArray cleanCash:(NSArray*)cleanCash investCash:(NSArray*)investCash;

- (void)updateChartWithMonthCount2:(NSArray*)monthsArray2 investCash:(NSArray*)investCash2;
- (void)updateChartWithMonthCount3:(NSArray*)monthsArray3 investCash:(NSArray*)investCash3;

@end
