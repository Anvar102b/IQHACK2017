//
//  ChoiceStrategyViewController.h
//  IQOptionHack
//
//  Created by Динар Габдуллин on 23.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoiceStrategyViewController : UIViewController

- (void)setFirstStrategyMonth:(NSInteger)firstMonth
          secondStrategyMonth:(NSInteger)secondMonth
           fhirdStrategyMonth:(NSInteger)thirdMonth
                          sum:(CGFloat)sum;
@end
