//
//  EasyNumberPad.m
//  EasyNumberPadDemo
//
//  Created by David Beckemeyer on 2/10/16.
//  Copyright © 2016 BDT.COM. All rights reserved.
//

#import "EasyNumberPad.h"

@implementation EasyNumberPad

+ (CGSize)buttonSize
{
    return CGSizeMake(81.0, 78.0);
}

+ (CGPoint)buttonSpacing
{
    return CGPointMake(25.0f, 25.0f);
}

- (void)configureButton:(UIView *)button forNumber:(NSNumber *)number
{
    [super configureButton:button forNumber:number];
    
    button.backgroundColor = [UIColor whiteColor];
    
    [(UIButton *)button setTitleColor:[UIColor colorWithRed:61/255. green:133/255. blue:198/255. alpha:1.0] forState:UIControlStateNormal];
    [(UIButton *)button setTitleColor:[UIColor colorWithRed:81/255. green:153/255. blue:228/255. alpha:1.0] forState:UIControlStateHighlighted];
    
    [[(UIButton *)button titleLabel] setFont:[UIFont fontWithName:@"Slackey" size:50]];
    [[(UIButton *)button layer] setBorderColor:[UIColor colorWithRed:61/255. green:133/255. blue:198/255. alpha:1.0].CGColor];
    [[(UIButton *)button layer] setBorderWidth:1];
    [[(UIButton *)button layer] setCornerRadius:8];
    [[(UIButton *)button titleLabel] setText:[NSString stringWithFormat:@"%ld", (long)number]];
}


- (void)configureBackButton:(UIView *)button
{
    [(UIButton *)button setImage:[UIImage imageNamed:@"Backspace"] forState:UIControlStateNormal];
    
   // button.backgroundColor = [UIColor redColor];
    
}

- (void)configureDoneButton:(UIView *)button
{
    //button.backgroundColor = [UIColor blueColor];
}

@end
