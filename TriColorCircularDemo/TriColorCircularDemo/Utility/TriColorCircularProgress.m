//
//  TriColorCircularProgress.m
//  CoreGraphicsTutorial
//
//  Created by Adnure, Jay  on 5/30/15.
//  Copyright (c) 2015 Adnure, Jay . All rights reserved.
//

#import "TriColorCircularProgress.h"
#import "ProgressLayer.h"


#define kBackgroundColor [UIColor clearColor]



@implementation TriColorCircularProgress



-(id)initWithFrame:(CGRect)frame withLineWidth:(CGFloat)lineWidth_ radius:(CGFloat)radius withValues:(NSArray*)values withColorRefrences:(NSArray*)colorArray_{
    
    self = [super initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    
    if (self) {
        
    
        self.backgroundColor = kBackgroundColor;
        
        lineWidth = lineWidth_;
        circleRadius = radius;
        progressvalues = [NSArray arrayWithArray:values];
        colorArray = [NSArray arrayWithArray:colorArray_];
        
        [self getTotalValueForCircularProgress];
        
    }
    
    return self;
}



// Get startAngle and endAngle

-(void)getTotalValueForCircularProgress{
    
    for (NSString *value in progressvalues) {
        
        totalValue += [value floatValue];
        
    }
}



-(void)drawProgressLayer:(CGFloat)startAngle_{
    
    CGFloat startAngle = startAngle_;
    float endAngle = ([[progressvalues objectAtIndex:valueIndex] floatValue]/totalValue) * 2 * 3.14 + startAngle;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2,self.frame.size.height/2.0) radius:circleRadius startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    UIColor *color = [colorArray objectAtIndex:valueIndex];
    
    ProgressLayer *shapeLayer = [[ProgressLayer alloc] initWithColor:color.CGColor lineWidth:lineWidth withPath:path];

    [self.layer addSublayer:shapeLayer];

    valueIndex++;
    if (valueIndex<progressvalues.count)
        [self drawProgressLayer:endAngle];
    else{
        valueIndex =0;
    }
}


- (void)willMoveToSuperview:(UIView *)newSuperview{
    
    [self drawProgressLayer:-M_PI_2];
    

}
-(void)didMoveToSuperview{
    
    for (CALayer *layer in [self.layer sublayers]) {

        // Configure animation
        CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        
        drawAnimation.duration            = 0.5;
        drawAnimation.repeatCount         = 0.0;  // Animate only once..
        drawAnimation.removedOnCompletion = NO;   // Remain stroked after the animation..
        
        // Animate from no part of the stroke being drawn to the entire stroke being drawn
        drawAnimation.fromValue = [NSNumber numberWithFloat:0.0];
        drawAnimation.toValue   = [NSNumber numberWithFloat:1.0];
        
        // Experiment with timing to get the appearence to look the way you want
        drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        
        // Add the animation to the circle
        [layer addAnimation:drawAnimation forKey:@"drawCircleAnimation"];
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGPoint center = CGPointMake(rect.size.width/2.0, rect.size.height/2.0);

    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetShouldAntialias(context, true);
    
    float startAngle = 0.0;
    float radius = circleRadius;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    startAngle = 0;
    float endAngle = 2 * M_PI;
    
    [bezierPath addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    // Set the display for the path, and stroke it
    [bezierPath setLineWidth:lineWidth];
    
    [[UIColor colorWithRed:69/255. green:71/255. blue:61/255. alpha:1.0] setStroke];
    [bezierPath stroke];

    
    
}


@end
