//
//  NewTargetViewController.m
//  IQOptionHack
//
//  Created by Anvar Basharov on 22.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import "NewTargetViewController.h"
#import "HandlerService.h"
#import "CalculationsService.h"

@interface NewTargetViewController ()
@property (weak, nonatomic) IBOutlet UIButton *continueButton;

@property (nonatomic, strong) CalculationsService *calcService;

@end

@implementation NewTargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.calcService = [CalculationsService new];
    self.calcService.view = self;
    [self.calcService setProcent:0.125/12.0];
    [self.calcService didSetTargetPayment:100000];
    
    
    
}

#pragma mark - NewTargetInput

- (void)enableFirstSlider:(BOOL)enable {
    
}

- (void)enableSecondSlider:(BOOL)enable {
    
}

- (void)showChart:(BOOL)show {
    
}

- (void)calculetedMinMonthPayment:(CGFloat)minMonthPayment
                  maxMonthPayment:(CGFloat)maxMonthPayment {
    
}

- (void)monthPaymentDidChanged:(CGFloat)monthPayment {
    
}

- (void)updateChartWithMonthCount:(NSArray*)monthsArray cleanCash:(NSArray*)cleanCash investCash:(NSArray*)investCash {
    
}

- (void)monthCountDidChanged:(CGFloat)monthCount {
    
}

- (void)updateFirstSlider:(CGFloat)firstSliderValue {
    
}

- (void)updateSecondSlider:(CGFloat)secondSliderValue {
    
}



- (IBAction)continueButtonAction:(id)sender {
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
