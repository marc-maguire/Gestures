//
//  TapGestureViewController.m
//  Gestures
//
//  Created by Marc Maguire on 2017-05-12.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "TapGestureViewController.h"

@interface TapGestureViewController ()

@end

@implementation TapGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *tapSquare = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds)-100/2, CGRectGetMidY(self.view.bounds)-100/2, 100, 100)];
    tapSquare.backgroundColor = [UIColor purpleColor];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureRecognized:)];
    [tapSquare addGestureRecognizer:tapGesture];
    [self.view addSubview:tapSquare];

}


-(IBAction)tapGestureRecognized:(UITapGestureRecognizer *)sender {
    
    sender.view.backgroundColor = [sender.view.backgroundColor isEqual:[UIColor purpleColor]] ? [UIColor orangeColor] : [UIColor purpleColor];
}

@end
