//
//  DrawView.h
//  Quiz8
//
//  Created by Rachel Johnson on 4/11/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView
{
    NSMutableArray *points;
}

@property (nonatomic) CGPoint currentPoint;
@property (nonatomic) float currentVelocity;
@property (nonatomic) float currentHorizontalAngle;
@property (nonatomic) float currentVerticalAngle;

- (void)saveCurrentPoint;
- (void)drawCurrentPoint;
- (void)clearBoard;

@end
