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


- (void)setDays:(NSInteger)days sum:(CGFloat)sum {
    
    
}

- (void)setFirstStrategyString:(NSString *)firstString
                secondStrategy:(NSString *)secondString
                 fhirdStrategy:(NSString *)thirdString {
}

@end
