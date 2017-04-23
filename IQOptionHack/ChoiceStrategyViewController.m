//
//  ChoiceStrategyViewController.m
//  IQOptionHack
//
//  Created by Динар Габдуллин on 23.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import "ChoiceStrategyViewController.h"
#import "StrategyDetailViewController.h"

@interface ChoiceStrategyViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firsdDay;
@property (weak, nonatomic) IBOutlet UILabel *secondDay;
@property (weak, nonatomic) IBOutlet UILabel *thirdDay;

@property (nonatomic, assign) CGFloat sum;

@property (nonatomic, assign) NSInteger first;
@property (nonatomic, assign) NSInteger second;
@property (nonatomic, assign) NSInteger third;

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
}

- (IBAction)didChoiceFirstStrategy:(id)sender {
    
}

- (IBAction)didChoiceSecondStrategy:(id)sender {
    
}

- (IBAction)didChoiceThirdStrategy:(id)sender {
    
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
    return @[@{@"List" : @[@{@"Name" : @"Медицина", @"income" : @10, @"area" : @20},
                           @{@"Name" : @"ИТ", @"income" : @0, @"area" : @30},
                           @{@"Name" : @"Недвижимость", @"income" : @10, @"area" : @30},
                           @{@"Name" : @"Сырье", @"income" : @0, @"area" : @20},
                           @{@"Name" : @"Ретейл", @"income" : @10, @"area" : @20}
                       ]}];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    StrategyDetailViewController *vc  = [segue destinationViewController];
    [vc setModel:[self configModel][0]];
}

@end
