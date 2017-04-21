//
//  NewTargetOutput.h
//  IQOptionHack
//
//  Created by Anvar Basharov on 22.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NewTargetOutput <NSObject>

- (void)didSetTargetPayment:(NSInteger)paymentTarget;
- (void)didSlideMonthSlider:(NSInteger)monthCount;
- (void)didSlidePaymentSlider:(NSInteger)paumentValue;

@end
