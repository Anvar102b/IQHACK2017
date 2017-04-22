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

@end


@implementation CalculationsService

- (void)setProcent:(CGFloat)procent {
    _procent = procent;
}

- (void)didSetTargetPayment:(NSInteger)paymentTarget {
    self.targetPayment = paymentTarget;
    
    CGFloat minMonthPay = [self paymentForMonth:6];
    CGFloat maxMonthPay = [self paymentForMonth:12];
    self.paymentValue = minMonthPay;
    self.monthsCount = 6;
    [self.view calculetedMinMonthPayment:minMonthPay maxMonthPayment:maxMonthPay];
    
    [self.view updateChartWithMonthCount:[self monthsArray] cleanCash:[self yelloyCashArray] investCash:[self greenCashArray]];
    
    
}

- (void)didSlideMonthSlider:(NSInteger)monthCount {
    self.monthsCount = monthCount;
    self.paymentValue = [self paymentForMonth:self.monthsCount];
    [self.view updateSecondSlider:self.paymentValue];
    
}

- (void)didSlidePaymentSlider:(CGFloat)paymentValue {
    self.paymentValue = paymentValue;
    [self.view updateSecondSlider:(CGFloat)self.targetPayment/self.paymentValue];
    [self.view updateChartWithMonthCount:[self monthsArray] cleanCash:[self yelloyCashArray] investCash:[self greenCashArray]];
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

- (NSArray*)monthsArray {
    NSMutableArray* array = [NSMutableArray array];
    for (int i = 1; i < self.monthsCount+1; i++) {
        [array addObject:@(i)];
    }
    return array;
}

//Массив значений для желтой линии
- (NSArray*)yelloyCashArray {
    NSMutableArray* cleanChashArray = [NSMutableArray array];
    for (int i = 1; i < self.monthsCount+1; i++) {
        CGFloat monthPay = [self paymentForMonth:self.monthsCount] * (CGFloat)i;
       //  NSLog(@" yelloyCashArray Ежемесячный платеж платеж: %f", monthPay);
        [cleanChashArray addObject:@(monthPay)];
    }
    return cleanChashArray;
}

//Массив значений для зеленой линии
- (NSArray*)greenCashArray {
    NSMutableArray* greenChashArray = [NSMutableArray array];
    for (int i = 1; i < self.monthsCount+1; i++) {
        CGFloat one = ((pow(1 + self.procent, i)) - 1);
        CGFloat two = (1 + self.procent) - 1;
        CGFloat monthCash = self.paymentValue * (one/two);
        [greenChashArray addObject:@(monthCash)];
    }
    return greenChashArray;
}


@end






