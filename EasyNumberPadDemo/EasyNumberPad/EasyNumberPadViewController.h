//
//  EasyNumberPadViewController.h
//  EasyNumberPadDemo
//
//  Created by David Beckemeyer on 2/10/16.
//  Copyright © 2016 BDT.COM. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EasyNumberPadViewController;

@protocol EasyNumberPadDelegate <NSObject>

@required
-(void) done:(EasyNumberPadViewController *)controller withText:(NSString *)text;
-(void) cancelled:(EasyNumberPadViewController *)controller;
@end

@interface EasyNumberPadViewController : UIViewController

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, assign) id<EasyNumberPadDelegate> delegate;

@end


