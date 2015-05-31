//
//  ProgressLayer.h
//  CoreGraphicsTutorial
//
//  Created by Adnure, Jay  on 5/30/15.
//  Copyright (c) 2015 Adnure, Jay (external - Project). All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface ProgressLayer : CAShapeLayer{
    
    
    
}

-(id)initWithColor:(CGColorRef)color lineWidth:(CGFloat)lineWidth withPath:(UIBezierPath*)path;

@end
