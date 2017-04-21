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
    self.procent = procent;
}

- (void)didSetTargetPayment:(NSInteger)paymentTarget {
    self.targetPayment = paymentTarget;
    [self.view calculetedMinMonthPayment:[self paymentForMonth:6] maxMonthPayment:[self paymentForMonth:12]];
    
    
}

- (void)didSlideMonthSlider:(NSInteger)monthCount {
    self.monthsCount = monthCount;
}

- (void)didSlidePaymentSlider:(CGFloat)paymentValue {
    self.paymentValue = paymentValue;
}

#pragma mark Private 

- (CGFloat)paymentForMonth:(NSInteger)month {
    double payment = (double)self.targetPayment / ((pow(1 + self.procent, month)) - 1) / ((1 + self.procent) - 1);
    NSLog(@"Ежемесячный платеж для месяца:%ld платеж:%f", (long)month, (CGFloat)payment);
    return (CGFloat)payment;
}
//- (void)updateChartWithMonthCount:(NSArray*)monthsArray cleanCash:(NSArray*)cleanCash investCash:(NSArray*)investCash;
//- (NSArray*)cleanCach {
//    
//    
//    
//}


@end
