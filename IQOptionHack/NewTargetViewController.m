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
#import "ChoiceStrategyViewController.h"

#import "HandlerService.h"
#import "CalculationsService.h"


@interface NewTargetViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet CustomSlider *secondSlider;
@property (weak, nonatomic) IBOutlet UITextField *sumTextField;
@property (weak, nonatomic) IBOutlet ChartView *chartView;
@property (weak, nonatomic) IBOutlet UILabel *minLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxLabel;
@property (weak, nonatomic) IBOutlet UILabel* paymentMonthly;

@property (nonatomic, assign) NSInteger days1;
@property (nonatomic, assign) NSInteger days2;
@property (nonatomic, assign) NSInteger days3;

@property (nonatomic, strong) CalculationsService *calcService;
@end

CGFloat conservative = 0.107/12.0;
CGFloat restrained = 0.121/12.0;
CGFloat aggressive = 0.142/12.0;

@implementation NewTargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.secondSlider.enabled = false;
    self.sumTextField.delegate = self;
    self.calcService = [CalculationsService new];
    self.calcService.view = self;
    [self.calcService setProcent:conservative];
    [self.calcService setProcent2:restrained];
    [self.calcService setProcent3:aggressive];
//    [self.calcService didSetTargetPayment:300000];
    
}

#pragma mark - UITextField Action

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)didChangeSumValue:(id)sender {
    BOOL enable = self.sumTextField.text.length != 0;
    
    //if ([self.sumTextField.text integerValue] > 500000) {
        self.secondSlider.enabled = enable;
        [self.calcService didSetTargetPayment:[self.sumTextField.text integerValue]];
    //}
    
    
    BOOL enabled = [self.sumTextField.text integerValue] > 20000;
    self.continueButton.enabled = enabled;
    self.continueButton.alpha = enabled ? 1.0f : 0.5f;

}

#pragma mark - UIButton Action

- (IBAction)continueButtonAction:(id)sender {
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard"
//                                                             bundle: nil];
//
//    ChoiceStrategyViewController *controller = (ChoiceStrategyViewController*)[mainStoryboard
//                                                       instantiateViewControllerWithIdentifier: @"ChoiceStrategyViewController"];
}

#pragma mark - UISlider Action

- (IBAction)didChangeValueSecondSlider:(id)sender {
    self.paymentMonthly.text = [NSString stringWithFormat:@"%0.f руб", ceil(self.secondSlider.value)];
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
//    self.secondSlider.maximumValue = maxMonthPayment;
//    self.secondSlider.minimumValue = minMonthPayment;
    
    _minLabel.text = [NSString stringWithFormat:@"%li руб", maxValue];
    _maxLabel.text = [NSString stringWithFormat:@"%li руб", minValue];
}

- (void)monthPaymentDidChanged:(CGFloat)monthPayment {
    
}

- (void)updateChartWithMonthCount:(NSArray*)monthsArray cleanCash:(NSArray*)cleanCash investCash:(NSArray*)investCash {
    self.days1 = monthsArray.count;
    [self.chartView updateChartWithMonthCount:monthsArray cleanCash:cleanCash investCash:investCash];
}

- (void)updateChartWithMonthCount2:(NSArray*)monthsArray2 investCash:(NSArray*)investCash2 {
    self.days2 = monthsArray2.count;
    [self.chartView updateChartWithMonthCount2:monthsArray2 investCash:investCash2];
}

- (void)updateChartWithMonthCount3:(NSArray*)monthsArray3 investCash:(NSArray*)investCash3 {
    self.days3 = monthsArray3.count;
    [self.chartView updateChartWithMonthCount3:monthsArray3 investCash:monthsArray3];
}


- (void)monthCountDidChanged:(CGFloat)monthCount {
    
}

- (void)updateSecondSlider:(CGFloat)secondSliderValue {
    _secondSlider.value = secondSliderValue;
    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ChoiceStrategyViewController *vc  = [segue destinationViewController];
    [vc setFirstStrategyMonth:self.days1 secondStrategyMonth:self.days2 fhirdStrategyMonth:self.days3 sum:100];
}

@end
