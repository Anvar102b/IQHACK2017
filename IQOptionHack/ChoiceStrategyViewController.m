//
//  ChoiceStrategyViewController.m
//  IQOptionHack
//
//  Created by Динар Габдуллин on 23.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import "ChoiceStrategyViewController.h"
#import "StrategyDetailViewController.h"

#import "BackendService.h"

@interface ChoiceStrategyViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firsdDay;
@property (weak, nonatomic) IBOutlet UILabel *secondDay;
@property (weak, nonatomic) IBOutlet UILabel *thirdDay;

@property (nonatomic, assign) CGFloat sum;

@property (nonatomic, assign) NSInteger first;
@property (nonatomic, assign) NSInteger second;
@property (nonatomic, assign) NSInteger third;

@property (nonatomic, strong) NSArray *stategys;


@end

@implementation ChoiceStrategyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Выберите стратегию";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    self.firsdDay.text = [NSString stringWithFormat:@"Срок %li д.", self.first * 30];
    self.secondDay.text = [NSString stringWithFormat:@"Срок %li д.", self.second * 30];
    self.thirdDay.text = [NSString stringWithFormat:@"Срок %li д.", self.third * 30];
    
    BackendService *service = [[BackendService alloc]init];
    [service getSharesWithSum:self.sum success:^(NSArray *arrayData) {
        self.stategys = arrayData;
    }];
}

- (IBAction)didChoiceFirstStrategy:(id)sender {
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                                 bundle: nil];    
        StrategyDetailViewController *controller = (StrategyDetailViewController*)[mainStoryboard
                                                           instantiateViewControllerWithIdentifier: @"StrategyDetailViewController"];
    [controller setModel:self.stategys[0]];
    [controller setTitleString:@"Консервативная стратегия"];
    [self.navigationController pushViewController:controller animated:true];
}

- (IBAction)didChoiceSecondStrategy:(id)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    StrategyDetailViewController *controller = (StrategyDetailViewController*)[mainStoryboard
                                                                               instantiateViewControllerWithIdentifier: @"StrategyDetailViewController"];
    [controller setModel:self.stategys[1]];
    [controller setTitleString:@"Умеренная стратегия"];
    
    [self.navigationController pushViewController:controller animated:true];

}

- (IBAction)didChoiceThirdStrategy:(id)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    StrategyDetailViewController *controller = (StrategyDetailViewController*)[mainStoryboard
                                                                               instantiateViewControllerWithIdentifier: @"StrategyDetailViewController"];
    [controller setModel:self.stategys[2]];
    [controller setTitleString:@"Агрессивная стратегия"];
    [self.navigationController pushViewController:controller animated:true];

}

- (void)setFirstStrategyMonth:(NSInteger)firstMonth
          secondStrategyMonth:(NSInteger)secondMonth
           fhirdStrategyMonth:(NSInteger)thirdMonth
                          sum:(CGFloat)sum {
    self.first = firstMonth;
    self.second = secondMonth;
    self.third = thirdMonth;
    self.sum = sum;
}

- (NSArray *)configModel {
    return @[@{@"List" : @[@{@"Name" : @"Медицина", @"income" : @10, @"amount" : @20},
                           @{@"Name" : @"ИТ", @"income" : @0, @"amount" : @30},
                           @{@"Name" : @"Недвижимость", @"income" : @10, @"amount" : @30},
                           @{@"Name" : @"Сырье", @"income" : @0, @"amount" : @20},
                           @{@"Name" : @"Ретейл", @"income" : @10, @"amount" : @20}
                       ]}];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    StrategyDetailViewController *vc  = [segue destinationViewController];
    [vc setModel:[self configModel][0]];
}

@end
