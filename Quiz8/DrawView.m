//
//  DrawView.m
//  Quiz8
//
//  Created by Rachel Johnson on 4/11/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

@synthesize currentPoint,currentHorizontalAngle, currentVelocity, currentVerticalAngle;

/*- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"HERE");
    self = [super initWithFrame:frame];
    if (self) {
        points = [[NSMutableArray alloc]init];
        currentPoint = CGPointMake(self.bounds.size.width, self.bounds.size.height);
        NSLog(@"Point: %f , %f", currentPoint.x, currentPoint.y);
        [points addObject:[NSValue valueWithCGPoint:currentPoint]];
        currentHorizontalAngle = 0;
        currentVerticalAngle = 0;
        currentVelocity = 0;
        
        [self setBackgroundColor:[UIColor grayColor]];
        [self setMultipleTouchEnabled:YES];
    }
    return self;
}*/

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        points = [[NSMutableArray alloc]init];
        currentPoint = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2);
        [points addObject:[NSValue valueWithCGPoint:currentPoint]];
        currentHorizontalAngle = 0;
        currentVerticalAngle = 0;
        currentVelocity = 0;
        
        [self setBackgroundColor:[UIColor grayColor]];
        [self setMultipleTouchEnabled:YES];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    UIBezierPath *bz = [[UIBezierPath alloc]init];
    [bz setLineWidth:3.0];
    [[UIColor blackColor]setStroke];
    [bz moveToPoint:[[points objectAtIndex:0] CGPointValue]];
    for(id p in points){
        [bz addLineToPoint:[p CGPointValue]];
    }
    CGPoint lastPoint = [[points lastObject]CGPointValue];
    //NSLog(@"Point: %f , %f", [[points objectAtIndex:0] CGPointValue].x, [[points objectAtIndex:0] CGPointValue].y);
    currentPoint = CGPointMake(lastPoint.x + (self.currentHorizontalAngle * 10.0), lastPoint.y + (self.currentVerticalAngle * 10.0));
    if(currentPoint.x < 0){
        currentPoint.x = 0;
    }
    if(currentPoint.y < 0){
        currentPoint.y = 0;
    }
    if(currentPoint.x > self.bounds.size.width){
        currentPoint.x = self.bounds.size.width;
    }
    if(currentPoint.y > self.bounds.size.height){
        currentPoint.y = self.bounds.size.height;
    }
    [bz addLineToPoint:currentPoint];
    
    //this line here is being wierd
    [self saveCurrentPoint];
    [bz stroke];
    [self drawCurrentPoint];
}

- (void)saveCurrentPoint
{    
    [points addObject:[NSValue valueWithCGPoint:currentPoint]];
    [self setNeedsDisplay];
}

- (void)drawCurrentPoint
{
    [[UIColor whiteColor] setStroke];
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:currentPoint];
    [path setLineWidth:3];
    CGPoint p = CGPointMake(currentPoint.x - 2, currentPoint.y - 2);
    [path addLineToPoint:p];
    p.x += 4.0;
    [path addLineToPoint:p];
    p.y += 4.0;
    [path addLineToPoint:p];
    p.x -= 4.0;
    [path addLineToPoint:p];
    p.y -= 4.0;
    [path addLineToPoint:p];
    [path stroke];
    [self setNeedsDisplay];
}


- (void)clearBoard{
    points = nil;
    points = [[NSMutableArray alloc]init];
    [points addObject:[NSValue valueWithCGPoint:currentPoint]];
    [self setNeedsDisplay];
    currentHorizontalAngle = 0;
    currentVerticalAngle = 0;

}


@end
