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
    self.firstProcent.text = [NSString stringWithFormat:@"%@%%", [share1[@"income"] stringValue]];
    self.firstPrice.text = [share1[@"area"] stringValue];

    NSDictionary *share2 = self.shares[1];
    self.secondName.text = share2[@"Name"];
    self.secondProcent.text = [NSString stringWithFormat:@"%@%%", [share2[@"income"] stringValue]];;
    self.secondPrice.text = [share2[@"area"] stringValue];
    
    NSDictionary *share3 = self.shares[2];
    self.thirdName.text = share3[@"Name"];
    self.thirdProcent.text = [NSString stringWithFormat:@"%@%%", [share3[@"income"] stringValue]];;
    self.thirdPrice.text = [share3[@"area"] stringValue];
    
    NSDictionary *share4 = self.shares[3];
    self.fourthName.text = share4[@"Name"];
    self.fourthProcent.text = [NSString stringWithFormat:@"%@%%", [share4[@"income"] stringValue]];;
    self.fourthPrice.text = [share4[@"area"] stringValue];
    
    NSDictionary *share5 = self.shares[4];
    self.fifthName.text = share5[@"Name"];
    self.fifthProcent.text = [NSString stringWithFormat:@"%@%%", [share5[@"income"] stringValue]];;
    self.fifthPrice.text = [share5[@"area"] stringValue];
}


- (void)setTitleString:(NSString *)title  {
    self.titleString = title;
}

- (void)setModel:(NSDictionary *)model {
    self.shares = model[@"List"];
}

@end
