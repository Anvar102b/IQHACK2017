//
//  CalculationsService.m
//  IQOptionHack
//
//  Created by Anvar Basharov on 22.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import "CalculationsService.h"

@interface CalculationsService ()

@property (nonatomic, assign) NSInteger targetPayment;
@property (nonatomic, assign) CGFloat procent;
@property (nonatomic, assign) NSInteger monthsCount;
@property (nonatomic, assign) CGFloat paymentValue;

@property (nonatomic, assign) CGFloat procent2;
@property (nonatomic, assign) NSInteger monthsCount2;

@property (nonatomic, assign) CGFloat procent3;
@property (nonatomic, assign) NSInteger monthsCount3;

@end


@implementation CalculationsService

- (void)setProcent:(CGFloat)procent {
    _procent = procent;
}

- (void)setProcent2:(CGFloat)procent2 {
    _procent2 = procent2;
}

- (void)setProcent3:(CGFloat)procent3 {
    _procent3 = procent3;
}

- (void)didSetTargetPayment:(NSInteger)paymentTarget {
//    
    if (paymentTarget < 200000) {
        return;
    }
    
    self.targetPayment = paymentTarget;
    
    CGFloat maxMonthPay = 50000;
    CGFloat minMonthPay = 5000;
    
    self.paymentValue = minMonthPay;
    [self.view updateSecondSlider:minMonthPay];
    
    self.monthsCount = [self monthLimit:_procent];
    self.monthsCount2 = [self monthLimit:_procent2];
    self.monthsCount3 = [self monthLimit:_procent3];
    
    [self.view calculetedMinMonthPayment:maxMonthPay maxMonthPayment:minMonthPay];
    
      [self.view updateChartWithMonthCount:[self monthsArray:[self monthLimit:_procent]] cleanCash:[self yelloyCashArray] investCash:[self greenCashArray:_procent monthsCount:[self monthLimit:_procent]]];
    
    [self.view updateChartWithMonthCount2:[self monthsArray:[self monthLimit:_procent2]] investCash:[self greenCashArray:_procent monthsCount:[self monthLimit:_procent2]]];
    
    [self.view updateChartWithMonthCount3:[self monthsArray:[self monthLimit:_procent3]] investCash:[self greenCashArray:_procent monthsCount:[self monthLimit:_procent3]]];
    
}


- (void)didSlidePaymentSlider:(CGFloat)paymentValue {
    self.paymentValue = paymentValue;
    self.monthsCount = [self monthLimit:_procent];
    self.monthsCount2 = [self monthLimit:_procent2];
    self.monthsCount3 = [self monthLimit:_procent3];
    
    [self.view updateChartWithMonthCount:[self monthsArray:[self monthLimit:_procent]] cleanCash:[self yelloyCashArray] investCash:[self greenCashArray:_procent monthsCount:[self monthLimit:_procent]]];
    
    [self.view updateChartWithMonthCount2:[self monthsArray:[self monthLimit:_procent2]] investCash:[self greenCashArray:_procent monthsCount:[self monthLimit:_procent2]]];
    
    [self.view updateChartWithMonthCount3:[self monthsArray:[self monthLimit:_procent3]] investCash:[self greenCashArray:_procent monthsCount:[self monthLimit:_procent3]]];
    
}

#pragma mark Private 

- (CGFloat)paymentForMonth:(NSInteger)month {
    CGFloat one = ((pow(1 + self.procent, month)) - 1);
    CGFloat two = (1 + self.procent) - 1;    
    CGFloat payment = (CGFloat)self.targetPayment / (one/two);
   // NSLog(@"Ежемесячный платеж для месяца:%ld платеж:%f", (long)month, payment);
    return (CGFloat)payment;
}


//Массив для графика месяцы

- (NSArray*)monthsArray:(NSInteger)monthsCount {
    NSMutableArray* array = [NSMutableArray array];
    for (int i = 1; i < monthsCount + 1; i++) {
        [array addObject:@(i)];
    }
    return array;
}

//Массив значений для желтой линии
- (NSArray*)yelloyCashArray {
    NSMutableArray* cleanChashArray = [NSMutableArray array];
    for (int i = 1; i < self.monthsCount+1; i++) {
        CGFloat monthPay = [self paymentForMonth:self.monthsCount] * (CGFloat)i;
//         NSLog(@" yelloyCashArray платеж: %f", monthPay);
        [cleanChashArray addObject:@(monthPay)];
    }
    return cleanChashArray;
}

//Массив значений для зеленой линии
- (NSArray*)greenCashArray:(CGFloat)procent monthsCount:(NSInteger)monthCount {
    NSMutableArray* greenChashArray = [NSMutableArray array];
    for (int i = 1; i < monthCount+1; i++) {
        CGFloat one = ((CGFloat)(pow(1 + procent, i)) - 1);
        CGFloat two = (1 + procent) - 1;
        CGFloat monthCash = self.paymentValue * (one/two);
        NSLog(@" greenCashArray прибыль: %2.f", monthCash);

        [greenChashArray addObject:@(monthCash)];
    }
    return greenChashArray;
}

- (NSInteger)monthLimit:(CGFloat)procent {
    CGFloat A = self.targetPayment;
    CGFloat a =  self.paymentValue; // [self paymentForMonth:self.monthsCount];
    CGFloat p = 1 + procent;
    A = A*(p-1);
    
    double limit = log(1 + A/a)/log(p);
    NSInteger lim = ceil(limit);
    return lim;
}


@end






