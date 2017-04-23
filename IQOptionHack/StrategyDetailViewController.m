//
//  StrategyDetailViewController.m
//  IQOptionHack
//
//  Created by Динар Габдуллин on 23.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import "StrategyDetailViewController.h"
#import "CumSumBarView.h"
#import "SecondChartView.h"

@interface StrategyDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (weak, nonatomic) IBOutlet UILabel *secondName;
@property (weak, nonatomic) IBOutlet UILabel *thirdName;
@property (weak, nonatomic) IBOutlet UILabel *fourthName;
@property (weak, nonatomic) IBOutlet UILabel *fifthName;

@property (weak, nonatomic) IBOutlet UILabel *firstProcent;
@property (weak, nonatomic) IBOutlet UILabel *secondProcent;
@property (weak, nonatomic) IBOutlet UILabel *thirdProcent;
@property (weak, nonatomic) IBOutlet UILabel *fourthProcent;
@property (weak, nonatomic) IBOutlet UILabel *fifthProcent;

@property (weak, nonatomic) IBOutlet UILabel *firstPrice;
@property (weak, nonatomic) IBOutlet UILabel *secondPrice;
@property (weak, nonatomic) IBOutlet UILabel *thirdPrice;
@property (weak, nonatomic) IBOutlet UILabel *fourthPrice;
@property (weak, nonatomic) IBOutlet UILabel *fifthPrice;


@property (weak, nonatomic) IBOutlet UILabel *firstColumnProcent;
@property (weak, nonatomic) IBOutlet UILabel *secondColumnProcent;
@property (weak, nonatomic) IBOutlet UILabel *thirdColumnProcent;
@property (weak, nonatomic) IBOutlet UILabel *fourthColumnProcent;
@property (weak, nonatomic) IBOutlet UILabel *fifthColumnProcent;


@property (weak, nonatomic) IBOutlet SecondChartView *chart;


@property (nonatomic, strong) NSString *titleStrategy;
@property (nonatomic, strong) NSArray *shares;

@end

@implementation StrategyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleStrategy;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    NSDictionary *share1 = self.shares[0];
    self.firstName.text = share1[@"name"];
    NSString *income1 = [share1[@"income"] stringValue];
    if (income1.length > 3)
        income1 = [income1 substringToIndex:3];
    NSString *procent1 = [NSString stringWithFormat:@"%@%%", [share1[@"income"] stringValue]];
    self.firstProcent.text = procent1;
    NSString *amount1 = [share1[@"amount"] stringValue];
    if (amount1.length > 7)
        amount1 = [amount1 substringToIndex:7];
    self.firstPrice.text = [NSString stringWithFormat:@"%@ р.", amount1];

    NSDictionary *share2 = self.shares[1];
    NSString *income2 = [share2[@"income"] stringValue];
    if (income2.length > 4)
        income2 = [income2 substringToIndex:4];
    NSString *procent2 = [NSString stringWithFormat:@"%@%%", income2];
    self.secondName.text = share2[@"name"];
    self.secondProcent.text = procent2;
    NSString *amount2 = [share2[@"amount"] stringValue];
    if (amount2.length > 7)
        amount2 = [amount2 substringToIndex:7];
    self.secondPrice.text = [NSString stringWithFormat:@"%@ р.", amount2];;
    
    NSDictionary *share3 = self.shares[2];
    NSString *income3 = [share3[@"income"] stringValue];
    if (income3.length > 3)
        income3 = [income3 substringToIndex:3];
    NSString *procent3 = [NSString stringWithFormat:@"%@%%", income3];
    self.thirdName.text = share3[@"name"];
    self.thirdProcent.text = procent3;
    NSString *amount3 = [share3[@"amount"] stringValue];
    if (amount3.length > 7)
        amount3 = [amount3 substringToIndex:7];
    self.thirdPrice.text = [NSString stringWithFormat:@"%@ р.", amount3];;
    
    NSDictionary *share4 = self.shares[3];
    NSString *income4 = [share4[@"income"] stringValue];
    if (income4.length > 3)
        income4 = [income4 substringToIndex:3];
    NSString *procent4 = [NSString stringWithFormat:@"%@%%", income4];
    self.fourthName.text = share4[@"name"];
    self.fourthProcent.text = procent4;
    NSString *amount4 = [share4[@"amount"] stringValue];
    if (amount4.length > 7)
        amount4 = [amount4 substringToIndex:7];
    self.fourthPrice.text = [NSString stringWithFormat:@"%@ р.", amount4];;
    
    NSDictionary *share5 = self.shares[4];
    NSString *income5 = [share5[@"income"] stringValue];
    if (income5.length > 3)
        income5 = [income5 substringToIndex:3];

    NSString *procent5 = [NSString stringWithFormat:@"%@%%", income5];
    self.fifthName.text = share5[@"name"];
    self.fifthProcent.text = procent5;
    NSString *amount5 = [share5[@"amount"] stringValue];
    if (amount5.length > 7)
        amount5 = [amount5 substringToIndex:7];

    self.fifthPrice.text = [NSString stringWithFormat:@"%@ р.", amount5];
    
    self.firstColumnProcent.text = procent1;
    self.secondColumnProcent.text = procent2;
    self.thirdColumnProcent.text = procent3;
    self.fourthColumnProcent.text = procent4;
    self.fifthColumnProcent.text = procent5;
 
    [self.chart setProcents:[share1[@"income"] floatValue] second:[share2[@"income"] floatValue] third:[share3[@"income"] floatValue] fourth:[share4[@"income"] floatValue] fifht:[share5[@"income"] floatValue]];
    
}

- (void)setTitleString:(NSString *)title  {
    self.titleStrategy = title;
}

- (void)setModel:(NSDictionary *)model {
    self.shares = model[@"List"];
}

@end
