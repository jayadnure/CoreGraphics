//
//  TriColorCircularProgress.h
//  CoreGraphicsTutorial
//
//  Created by Adnure, Jayon 5/30/15.
//  Copyright (c) 2015 Adnure, Jay . All rights reserved.
//




#import <UIKit/UIKit.h>

@interface TriColorCircularProgress : UIView{
    
    
    CGFloat lineWidth;
    CGFloat circleRadius;
    
    NSArray *progressvalues;
    NSArray *colorArray;
    
    CGFloat totalValue;
    int valueIndex;
        
}

/*

 Pass the frame where you want to place the TriColorCircularProgress
 Value - These are the proportion values in the circular graph
 colorArray -  The count of color array must be equal to count of value array
 
*/
-(id)initWithFrame:(CGRect)frame withLineWidth:(CGFloat)lineWidth_ radius:(CGFloat)radius withValues:(NSArray*)values withColorRefrences:(NSArray*)colorArray;

-(void)drawProgressLayer:(CGFloat)startAngle_;




@end





// For Refrence

//                        90  -PI/2
//
//                        |
//                        |
//                        |
//                        |
//                        |
//          - PI  |||||||||||||||||||||||||      +PI
//                        |
//                        |
//                        |
//                        |
//
//                        360  +PI/2

//To convert degrees to radians, first convert the number of degrees, minutes, and seconds to decimal form. Divide the number of minutes by 60 and add to the number of degrees. So, for example, 12° 28' is 12 + 28/60 which equals 12.467°. Next multiply by π and divide by 180 to get the angle in radians.
