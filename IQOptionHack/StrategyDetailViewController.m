//
//  StrategyDetailViewController.m
//  IQOptionHack
//
//  Created by Динар Габдуллин on 23.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import "StrategyDetailViewController.h"
#import "CumSumBarView.h"

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


@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) NSArray *shares;


@end

@implementation StrategyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.title;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    NSDictionary *share1 = self.shares[0];
    self.firstName.text = share1[@"Name"];
    NSString *procent1 = [NSString stringWithFormat:@"%@%%", [share1[@"income"] stringValue]];
    self.firstProcent.text = procent1;
    self.firstPrice.text = [NSString stringWithFormat:@"%@ р.", [share1[@"area"] stringValue]];

    NSDictionary *share2 = self.shares[1];
    NSString *procent2 = [NSString stringWithFormat:@"%@%%", [share2[@"income"] stringValue]];
    self.secondName.text = share2[@"Name"];
    self.secondProcent.text = procent2;
    self.secondPrice.text = [NSString stringWithFormat:@"%@ р.", [share2[@"area"] stringValue]];;
    
    NSDictionary *share3 = self.shares[2];
    NSString *procent3 = [NSString stringWithFormat:@"%@%%", [share3[@"income"] stringValue]];
    self.thirdName.text = share3[@"Name"];
    self.thirdProcent.text = procent3;
    self.thirdPrice.text = [NSString stringWithFormat:@"%@ р.", [share3[@"area"] stringValue]];;
    
    NSDictionary *share4 = self.shares[3];
    NSString *procent4 = [NSString stringWithFormat:@"%@%%", [share4[@"income"] stringValue]];
    self.fourthName.text = share4[@"Name"];
    self.fourthProcent.text = procent4;
    self.fourthPrice.text = [NSString stringWithFormat:@"%@ р.", [share3[@"area"] stringValue]];;
    
    NSDictionary *share5 = self.shares[4];
    NSString *procent5 = [NSString stringWithFormat:@"%@%%", [share5[@"income"] stringValue]];
    self.fifthName.text = share5[@"Name"];
    self.fifthProcent.text = procent5;
    self.fifthPrice.text = [NSString stringWithFormat:@"%@ р.", [share4[@"area"] stringValue]];
    
    self.firstColumnProcent.text = procent1;
    self.secondColumnProcent.text = procent2;
    self.thirdColumnProcent.text = procent3;
    self.fourthColumnProcent.text = procent4;
    self.fifthColumnProcent.text = procent5;
    
}


- (void)setTitleString:(NSString *)title  {
    self.titleString = title;
}

- (void)setModel:(NSDictionary *)model {
    self.shares = model[@"List"];
}

@end
