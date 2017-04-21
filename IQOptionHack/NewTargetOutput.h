//
//  NewTargetOutput.h
//  IQOptionHack
//
//  Created by Anvar Basharov on 22.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol NewTargetOutput <NSObject>

- (void)setProcent:(CGFloat)procent;
- (void)didSetTargetPayment:(NSInteger)paymentTarget;
- (void)didSlideMonthSlider:(NSInteger)monthCount;
- (void)didSlidePaymentSlider:(CGFloat)paymentValue;

@end
