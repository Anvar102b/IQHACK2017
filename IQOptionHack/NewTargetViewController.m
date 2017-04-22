//
//  NewTargetViewController.m
//  IQOptionHack
//
//  Created by Anvar Basharov on 22.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import "NewTargetViewController.h"
#import "HandlerService.h"
#import "CustomSlider.h"

@interface NewTargetViewController () <>
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet CustomSlider *firstSlider;
@property (weak, nonatomic) IBOutlet CustomSlider *secondSlider;
@property (weak, nonatomic) IBOutlet UITextField *sumTextField;

@end

@implementation NewTargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstSlider.enabled = false;
    self.secondSlider.enabled = false;
    
}

- (IBAction)didChangeSumValue:(id)sender {
    UITextField
    if()
}
- (IBAction)continueButtonAction:(id)sender {
    
}

- (IBAction)didChangeValueFirstSlider:(id)sender {
}

- (IBAction)didChangeValueSecondSlider:(id)sender {
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
