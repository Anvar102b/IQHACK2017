//
//  CalculationsService.h
//  IQOptionHack
//
//  Created by Anvar Basharov on 22.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewTargetOutput.h"
#import "NewTargetInput.h"

@interface CalculationsService : NSObject <NewTargetOutput>

@property (nonatomic, weak) id <NewTargetInput> view;

- (CGFloat)paymentForMonth:(NSInteger)month;
- (NSInteger)monthLimit:(CGFloat)procent;

@end
