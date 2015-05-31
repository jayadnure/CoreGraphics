//
//  ViewController.m
//  TriColorCircularDemo
//
//  Created by Adnure, Jay (external - Project) on 5/31/15.
//  Copyright (c) 2015 Adnure, Jay. All rights reserved.
//

#import "ViewController.h"
#import "TriColorCircularProgress.h"

@interface ViewController (){
    
    __weak IBOutlet UIView *contentView;
    
    NSArray *valueArray;
    NSArray *colorArray;
    
    TriColorCircularProgress * _progress;
    
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addProgressView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)addProgressView{
    
    if (!valueArray) {
        
        valueArray = @[@"60",@"20",@"15",@"5"];
        colorArray = @[[UIColor redColor],[UIColor blueColor],[UIColor greenColor],[UIColor blackColor]];
    }
    
    if (!_progress) {
        _progress = [[TriColorCircularProgress alloc] initWithFrame:contentView.frame withLineWidth:15.0 radius:60.0 withValues:valueArray withColorRefrences:colorArray];
    }
    [contentView addSubview:_progress];
    

}

@end
