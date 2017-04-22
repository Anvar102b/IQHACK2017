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
@property (weak, nonatomic) IBOutlet CustomSlider *firstSlider;
@property (weak, nonatomic) IBOutlet CustomSlider *secondSlider;
@property (weak, nonatomic) IBOutlet UITextField *sumTextField;
@property (weak, nonatomic) IBOutlet ChartView *ChartView;

@property (nonatomic, strong) CalculationsService *calcService;


@end

@implementation NewTargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstSlider.enabled = false;
    self.secondSlider.enabled = false;
    
    self.calcService = [CalculationsService new];
    self.calcService.view = self;
    
    [self.calcService didSetTargetPayment:100000];
}

#pragma mark - UITextField Action

- (IBAction)didChangeSumValue:(id)sender {
    BOOL enable = self.sumTextField.text.length != 0;
    self.firstSlider.enabled = enable;
    self.secondSlider.enabled = enable;
    
//    if (enable)
    [self.calcService didSetTargetPayment:[self.sumTextField.text integerValue]];
}

#pragma mark - UIButton Action

- (IBAction)continueButtonAction:(id)sender {
    
}

#pragma mark - UISlider Action

- (IBAction)didChangeValueFirstSlider:(id)sender {
    
    [self.calcService didSlideMonthSlider:ceil(self.firstSlider.value)];
}

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
    
}

- (void)monthPaymentDidChanged:(CGFloat)monthPayment {
    
}

- (void)updateChartWithMonthCount:(NSArray*)monthsArray cleanCash:(NSArray*)cleanCash investCash:(NSArray*)investCash {
    
}

- (void)monthCountDidChanged:(CGFloat)monthCount {
    
}

- (void)updateFirstSlider:(CGFloat)firstSliderValue {
    _firstSlider.value = firstSliderValue;
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
