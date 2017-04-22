//
//  NewTargetViewController.m
//  IQOptionHack
//
//  Created by Anvar Basharov on 22.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import "NewTargetViewController.h"
#import "CustomSlider.h"
#import "ChartView.h"

#import "HandlerService.h"
#import "CalculationsService.h"


@interface NewTargetViewController ()

@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet CustomSlider *secondSlider;
@property (weak, nonatomic) IBOutlet UITextField *sumTextField;
@property (weak, nonatomic) IBOutlet ChartView *chartView;
@property (weak, nonatomic) IBOutlet UILabel *minLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxLabel;


@property (nonatomic, strong) CalculationsService *calcService;
@end

CGFloat conservative = 0.107/12.0;
CGFloat restrained = 0.121/12.0;
CGFloat aggressive = 0.142/12.0;

@implementation NewTargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.secondSlider.enabled = false;
    
    self.calcService = [CalculationsService new];
    self.calcService.view = self;
    [self.calcService setProcent:conservative];
    [self.calcService didSetTargetPayment:10000];
    
}

#pragma mark - UITextField Action

- (IBAction)didChangeSumValue:(id)sender {
    BOOL enable = self.sumTextField.text.length != 0;
    self.secondSlider.enabled = enable;
    
    [self.calcService didSetTargetPayment:[self.sumTextField.text integerValue]];
}

#pragma mark - UIButton Action

- (IBAction)continueButtonAction:(id)sender {
    
}

#pragma mark - UISlider Action

- (IBAction)didChangeValueSecondSlider:(id)sender {
    [self.calcService didSlidePaymentSlider:ceil(self.secondSlider.value)];
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
    NSUInteger minValue = ceil(minMonthPayment);
    NSInteger maxValue = ceil(maxMonthPayment);
    self.secondSlider.minimumValue = maxMonthPayment;
    self.secondSlider.minimumValue = minMonthPayment;
    _minLabel.text = [NSString stringWithFormat:@"%li", maxValue];
    _maxLabel.text = [NSString stringWithFormat:@"%li", minValue];
}

- (void)monthPaymentDidChanged:(CGFloat)monthPayment {
    
}

- (void)updateChartWithMonthCount:(NSArray*)monthsArray cleanCash:(NSArray*)cleanCash investCash:(NSArray*)investCash {
    [self.chartView updateChartWithMonthCount:monthsArray cleanCash:cleanCash investCash:investCash];
}

- (void)monthCountDidChanged:(CGFloat)monthCount {
    
}

- (void)updateSecondSlider:(CGFloat)secondSliderValue {
    _secondSlider.value = secondSliderValue;
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
