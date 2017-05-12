//
//  PinchGestureViewController.m
//  Gestures
//
//  Created by Marc Maguire on 2017-05-12.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "PinchGestureViewController.h"

@interface PinchGestureViewController ()

@end

@implementation PinchGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //make a view
    //add it as a sub view
    //make a gesture recognizer
    //add it to the sub view
    //make an ibAction target for the gesture recognizer to hit
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds)-100/2, CGRectGetMidY(self.view.bounds)-100/2, 100, 100)];
    //this would make the origin of the view at the center of the superview, but you want the center of the view to be at the center of the superview. so you are offsetting the origin by a factor of half of the width and height to account for this change.
    view.backgroundColor = [UIColor blueColor];
    
   
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchGestureDetected:)];
   
    [view addGestureRecognizer:pinchGesture];
    [self.view addSubview:view];




}

-(IBAction)pinchGestureDetected:(UIPinchGestureRecognizer *)sender {
    CGFloat scale = sender.scale;
    sender.view.transform = CGAffineTransformMakeScale(scale, scale);
    
    scale = 1.0;
    //this way to values are not cumulative, we reset the scale between calls.
    
    
}

@end
