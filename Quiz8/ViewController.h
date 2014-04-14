//
//  ViewController.h
//  Quiz8
//
//  Created by Rachel Johnson on 4/11/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawView.h"

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>

@property (nonatomic) float lastVelocity;

@property (weak, nonatomic) IBOutlet DrawView *esView;
@property (strong, nonatomic) IBOutlet UIRotationGestureRecognizer *RightRotate;
@property (strong, nonatomic) IBOutlet UIRotationGestureRecognizer *leftRotate;
@property (weak, nonatomic) IBOutlet UIView *leftVIew;
@property (weak, nonatomic) IBOutlet UIView *rightVIew;


-(IBAction)addHorizontal:(id)sender;
-(IBAction)handleLineAdditions:(id)sender;
-(IBAction)addVertical:(id)sender;


@end
