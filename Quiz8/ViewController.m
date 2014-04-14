//
//  ViewController.m
//  Quiz8
//
//  Created by Rachel Johnson on 4/11/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"


@implementation ViewController
@synthesize esView;
@synthesize RightRotate;
@synthesize leftRotate;
@synthesize leftVIew;
@synthesize rightVIew;
@synthesize lastVelocity;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    RightRotate = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(handleLineAdditions:)];
    leftRotate = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(handleLineAdditions:)];
    [leftRotate setCancelsTouchesInView:NO];
    [RightRotate setCancelsTouchesInView:NO];
    
    [leftRotate setDelegate:self];
    [RightRotate setDelegate:self];
    
    leftVIew.userInteractionEnabled = YES;
    rightVIew.userInteractionEnabled = YES;
    
    [self.view addGestureRecognizer:leftRotate];
    [self.view addGestureRecognizer:RightRotate];
}

- (void)viewDidUnload
{
    [self setEsView:nil];
    [self setRightRotate:nil];
    [self setLeftRotate:nil];
    [self setLeftVIew:nil];
    [self setRightVIew:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (IBAction)handleLineAdditions:(id)sender{
    CGPoint point = [sender locationOfTouch:0 inView:self.view];
    if(point.x < self.view.bounds.size.width/2){
        [self addHorizontal:sender];
    }
    else{
        [self addVertical:sender];
    }
}

-(IBAction)addHorizontal:(id)sender{
    UIRotationGestureRecognizer *s = sender;
    if(lastVelocity > 0 && s.velocity < 0){
        [self.esView saveCurrentPoint];
    }
    if(lastVelocity < 0 && s.velocity > 0){
        [self.esView saveCurrentPoint];
    }
    [self.esView setCurrentHorizontalAngle:s.rotation];
    [self.esView setCurrentVelocity:s.velocity];
    if(s.state ==UIGestureRecognizerStateEnded){
        [self.esView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
}

-(IBAction)addVertical:(id)sender{
    UIRotationGestureRecognizer *s = sender;
    if(lastVelocity > 0 && s.velocity < 0){
        [self.esView saveCurrentPoint];
    }
    if(lastVelocity < 0 && s.velocity > 0){
        [self.esView saveCurrentPoint];
    }
    [self.esView setCurrentVerticalAngle:s.rotation];
    [self.esView setCurrentVelocity:s.velocity];
    if(s.state ==UIGestureRecognizerStateEnded){
        [self.esView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    if(gestureRecognizer == RightRotate && otherGestureRecognizer == leftRotate){
        return YES;
    }
    if(gestureRecognizer == leftRotate && otherGestureRecognizer == RightRotate){
        return YES;
    }
    
    return NO;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        [esView clearBoard];
    }
}
- (BOOL) canBecomeFirstResponder {
    return YES;
}


@end
