//
//  ChoiceStrategyViewController.m
//  IQOptionHack
//
//  Created by Динар Габдуллин on 23.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import "ChoiceStrategyViewController.h"

@interface ChoiceStrategyViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firsdDay;
@property (weak, nonatomic) IBOutlet UILabel *secondDay;
@property (weak, nonatomic) IBOutlet UILabel *thirdDay;

@property (nonatomic, assign) CGFloat sum;


@end

@implementation ChoiceStrategyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Выберите стратегию";
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
    self.firsdDay.text = [NSString stringWithFormat:@"Срок %li д.", firstMonth * 30];
    self.secondDay.text = [NSString stringWithFormat:@"Срок %li д.", secondMonth * 30];
    self.thirdDay.text = [NSString stringWithFormat:@"Срок %li д.", thirdMonth * 30];
    self.sum = sum;
}

@end
