//
//  ProgressLayer.m
//  CoreGraphicsTutorial
//
//  Created by Adnure, Jay on 5/30/15.
//  Copyright (c) 2015 Adnure, Jay (external - Project). All rights reserved.
//

#import "ProgressLayer.h"

@implementation ProgressLayer



-(id)initWithColor:(CGColorRef)color lineWidth:(CGFloat)lineWidth withPath:(UIBezierPath*)path{

    self = [super init];

    if (self) {
        
        self.path = [path CGPath];
        self.strokeColor = color;
        self.lineWidth = lineWidth;
        self.fillColor = [[UIColor clearColor] CGColor];
        [self setStrokeStart:0.0];
        [self setStrokeEnd:1.0];

    }
    
    return self;
}






@end
