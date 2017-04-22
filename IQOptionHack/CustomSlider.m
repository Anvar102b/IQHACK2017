//
//  CustomSlider.m
//  IQOptionHack
//
//  Created by Динар Габдуллин on 22.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import "CustomSlider.h"
#import "HandlerService.h"

@implementation CustomSlider

- (CGRect)trackRectForBounds:(CGRect)bounds {
    CGRect customRect = CGRectMake(0.f, 0.f, CGRectGetWidth(bounds), 8.f);
    [super trackRectForBounds:customRect];
    return customRect;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    UIImage *imageThumb = [UIImage imageNamed:@"SliderOval"];
    [self setThumbImage:[HandlerService imageWithImage:imageThumb scaledToSize:CGSizeMake(35.f, 35.f)] forState:UIControlStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
