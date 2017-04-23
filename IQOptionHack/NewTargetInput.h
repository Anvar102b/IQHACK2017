//
//  NewTargetInput.h
//  IQOptionHack
//
//  Created by Anvar Basharov on 22.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol NewTargetInput <NSObject>

- (void)enableFirstSlider:(BOOL)enable;
- (void)enableSecondSlider:(BOOL)enable;
- (void)showChart:(BOOL)show;

- (void)calculetedMinMonthPayment:(CGFloat)minMonthPayment
                  maxMonthPayment:(CGFloat)maxMonthPayment;

- (void)monthPaymentDidChanged:(CGFloat)monthPayment;
- (void)updateChartWithMonthCount:(NSArray*)monthsArray cleanCash:(NSArray*)cleanCash investCash:(NSArray*)investCash;

- (void)updateChartWithMonthCount2:(NSArray*)monthsArray2 investCash:(NSArray*)investCash2;
- (void)updateChartWithMonthCount3:(NSArray*)monthsArray3 investCash:(NSArray*)investCash3;

- (void)monthCountDidChanged:(CGFloat)monthCount;
//- (void)updateFirstSlider:(CGFloat)firstSliderValue;
- (void)updateSecondSlider:(CGFloat)secondSliderValue;

@end
