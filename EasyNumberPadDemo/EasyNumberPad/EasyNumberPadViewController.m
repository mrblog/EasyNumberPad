//
//  EasyNumberPadViewController.m
//  EasyNumberPadDemo
//
//  Created by David Beckemeyer on 2/10/16.
//  Copyright © 2016 BDT.COM. All rights reserved.
//

#import "EasyNumberPadViewController.h"

#define CONTAINER_WIDTH 344
#define CONTAINER_HEIGHT 540
#define BUTTON_SIZE 78
#define BUTTON_SPACING 25

@interface EasyNumberPadViewController ()

@end

@implementation EasyNumberPadViewController
{
    BOOL savedProvidesStyle;
    BOOL savedDefinesContext;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        savedProvidesStyle = self.presentingViewController.providesPresentationContextTransitionStyle;
        savedDefinesContext = self.presentingViewController.definesPresentationContext;
        self.presentingViewController.providesPresentationContextTransitionStyle = YES;
        self.presentingViewController.definesPresentationContext = YES;
        
        [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *overlay = [[UIView alloc] init];
    overlay.frame = CGRectMake(self.view.bounds.origin.x, 0, self.view.frame.size.width, 64);
    overlay.backgroundColor = [UIColor whiteColor];
    overlay.alpha = 0.4;
    overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:overlay];

    UIView *outer = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64)];
    outer.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    outer.backgroundColor = [UIColor whiteColor];

    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake((outer.frame.size.width-CONTAINER_WIDTH) / 2,  108, CONTAINER_WIDTH, CONTAINER_HEIGHT)];
    containerView.backgroundColor = [UIColor colorWithRed:207./255. green:226./255. blue:243./255. alpha:1.0];
    containerView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    containerView.layer.cornerRadius = 20;

    UIView *textContainer = [[UIView alloc] initWithFrame:CGRectMake(BUTTON_SPACING, BUTTON_SPACING, CONTAINER_WIDTH-BUTTON_SPACING*3-BUTTON_SIZE, BUTTON_SIZE)];
    textContainer.backgroundColor = [UIColor whiteColor];
    textContainer.layer.cornerRadius = 5;
    [containerView addSubview:textContainer];
    
    [outer addSubview:containerView];
    
    UILabel *heading = [[UILabel alloc] initWithFrame:CGRectMake((outer.frame.size.width-CONTAINER_WIDTH) / 2,  32, CONTAINER_WIDTH, 62)];
    [heading setFont:[UIFont fontWithName:@"Slackey" size:59]];
    heading.textColor = [UIColor colorWithRed:61/255. green:133/255. blue:198/255. alpha:1.0];
    [heading setText:@"Enter Pin"];
    heading.textAlignment = NSTextAlignmentCenter;
    heading.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    [outer addSubview:heading];

    [self.view addSubview:outer];
}


- (void) viewDidDisappear:(BOOL)animated {
    // restore state of presenting ViewController
    self.presentingViewController.providesPresentationContextTransitionStyle = savedProvidesStyle;
    self.presentingViewController.definesPresentationContext = savedDefinesContext;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
