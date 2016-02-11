//
//  EasyNumberPadViewController.m
//  EasyNumberPadDemo
//
//  Created by David Beckemeyer on 2/10/16.
//  Copyright © 2016 BDT.COM. All rights reserved.
//

#import "EasyNumberPadViewController.h"
#import "EasyNumberPad.h"

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

@synthesize textField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        savedProvidesStyle = self.presentingViewController.providesPresentationContextTransitionStyle;
        savedDefinesContext = self.presentingViewController.definesPresentationContext;
        self.presentingViewController.providesPresentationContextTransitionStyle = YES;
        self.presentingViewController.definesPresentationContext = YES;
        
        [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];

        // initialize textField here to ensure it is available in completion block
        textField = [[UITextField alloc] init];
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
    
    UIButton *dimmedView = [[UIButton alloc]init];
    dimmedView.frame = CGRectMake(0, 0, outer.frame.size.width, outer.frame.size.height);
    dimmedView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    dimmedView.backgroundColor = [UIColor clearColor];
    [dimmedView addTarget:self action:@selector(outerViewAction) forControlEvents:UIControlEventTouchUpInside];
    [outer addSubview:dimmedView];

    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake((outer.frame.size.width-CONTAINER_WIDTH) / 2,  108, CONTAINER_WIDTH, CONTAINER_HEIGHT)];
    containerView.backgroundColor = [UIColor colorWithRed:207./255. green:226./255. blue:243./255. alpha:1.0];
    containerView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    containerView.layer.cornerRadius = 20;

    UIView *textContainer = [[UIView alloc] initWithFrame:CGRectMake(BUTTON_SPACING, BUTTON_SPACING, CONTAINER_WIDTH-BUTTON_SPACING*3-BUTTON_SIZE, BUTTON_SIZE)];
    textContainer.backgroundColor = [UIColor whiteColor];
    textContainer.layer.cornerRadius = 5;
    [containerView addSubview:textContainer];
    
    UIButton *goButton = [[UIButton alloc] initWithFrame:CGRectMake(CONTAINER_WIDTH-BUTTON_SPACING-BUTTON_SIZE, BUTTON_SPACING, BUTTON_SIZE, BUTTON_SIZE)];
    [goButton setImage:[UIImage imageNamed:@"Go"] forState:UIControlStateNormal];
    [goButton addTarget:self action:@selector(goButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:goButton];
    
    EasyNumberPad *pad = [[EasyNumberPad alloc] initWithFrame:CGRectMake(BUTTON_SPACING, textContainer.frame.origin.y+BUTTON_SIZE+BUTTON_SPACING, CONTAINER_WIDTH-BUTTON_SPACING*2, BUTTON_SIZE*4+BUTTON_SPACING*3)];
    [containerView addSubview:pad];
    
    
    textField.frame = CGRectMake(15, 5, textContainer.frame.size.width-10, textContainer.frame.size.height-10);
    [pad linkToTextField:textField];
    
    [textField setTextColor:[UIColor darkGrayColor]];
    [textField setFont:[UIFont fontWithName:@"Helvetica Neue" size:34]];
    [textContainer addSubview:textField];
    
    [outer addSubview:containerView];
    
    UILabel *heading = [[UILabel alloc] initWithFrame:CGRectMake((outer.frame.size.width-CONTAINER_WIDTH) / 2,  32, CONTAINER_WIDTH, 62)];
    [heading setFont:[UIFont fontWithName:@"Slackey" size:59]];
    heading.textColor = [UIColor colorWithRed:61/255. green:133/255. blue:198/255. alpha:1.0];
    [heading setText:@"Enter Pin"];
    heading.textAlignment = NSTextAlignmentCenter;
    heading.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    [outer addSubview:heading];

    [self.view addSubview:outer];
    
    [textField becomeFirstResponder];
}


- (void) viewDidDisappear:(BOOL)animated {
    // restore state of presenting ViewController
    self.presentingViewController.providesPresentationContextTransitionStyle = savedProvidesStyle;
    self.presentingViewController.definesPresentationContext = savedDefinesContext;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - actions

- (void)goButtonPressed:(id)sender {
    NSLog(@"goButtonPressed: text %@", textField.text);
    if (_delegate != nil) {
        [_delegate done:self withText:textField.text];
    }

}

-(void) outerViewAction {
    NSLog(@"outerViewAction");
    if (_delegate != nil) {
        [_delegate cancelled:self];
    }

}
@end
