//
//  RotationGestureViewController.m
//  Gestures
//
//  Created by Marc Maguire on 2017-05-12.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "RotationGestureViewController.h"

@interface RotationGestureViewController ()

@end

@implementation RotationGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //make view, 100x100 pin to center minus offset of size
    //make rotation ib action method
    //make totation gesture recognizer
    //add view as subview
    //add recognizer to subview
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds)-100/2, CGRectGetMidY(self.view.bounds)-100/2, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationGestureDetected:)];
    
    [self.view addSubview:view];
    [view addGestureRecognizer:rotationGesture];
}

- (IBAction)rotationGestureDetected:(UIRotationGestureRecognizer *)sender {

//dont need to convert anything from degrees or radians - its just there.
    [sender.view setTransform:CGAffineTransformMakeRotation(sender.rotation)];
}


@end
