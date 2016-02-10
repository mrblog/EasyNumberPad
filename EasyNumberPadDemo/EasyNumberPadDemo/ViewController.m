//
//  ViewController.m
//  EasyNumberPadDemo
//
//  Created by David Beckemeyer on 2/10/16.
//  Copyright © 2016 BDT.COM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(self.view.bounds.origin.x, 20, self.view.frame.size.width, 44);
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    UIImage *homeImage = [[UIImage imageNamed:@"PhewHome.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [items addObject:[[UIBarButtonItem alloc] initWithImage:homeImage style:UIBarButtonItemStylePlain target:self action:@selector(homeButton:)]];
    [toolbar setItems:items animated:NO];
    [toolbar setTintColor:[UIColor whiteColor]];
    [toolbar setBarTintColor:[UIColor colorWithRed:20/255.0f green:109/255.0f blue:190/255.0f alpha:1.0f]];
    //[toolbar setBarTintColor:[UIColor clearColor]];
    [toolbar setTranslucent:YES];
    toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:toolbar];
    self.view.opaque = YES;
    self.view.backgroundColor = [UIColor clearColor];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    EasyNumberPadViewController *pad = [[EasyNumberPadViewController alloc] init];
    [self presentViewController:pad animated:YES completion:nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - mark local methods

-(void)homeButton:(id)sender {
    
}

@end
