//
//  FlightCell.m
//  ChocoTravelTest
//
//  Created by Yerlan Ismailov on 25.07.17.
//  Copyright © 2017 ismailov.com. All rights reserved.
//

#import "FlightCell.h"

@implementation FlightCell

-(instancetype)init {
    if (self) {
        self = [super init];
        self.isFinal = NO;
    }
    
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}


-(void)drawRect:(CGRect)rect {
    
    // drawong dashed line before
    CGPoint a = CGPointMake(97, 100);
    CGPoint b = CGPointMake(147, 100);
    
    [self drawDashedLineFromPointA:a pointB:b];
    
    // drawong dashed line after
    CGPoint a1 = CGPointMake(227, 100);
    CGPoint b1 = CGPointMake(277, 100);
    
    [self drawDashedLineFromPointA:a1 pointB:b1];
}

-(void)changeCellState {
    if (self.isFinal) {
        self.topLine.hidden = self.isFinal;
        self.bottomLine.hidden = self.isFinal;
        self.bottomLabel.textColor = [UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1.0];
        self.bottomLabel.font = [UIFont boldSystemFontOfSize:14];
        self.bottomLabel.text = @"Общее время в пути: 7 ч 35 мин";
    }
}

-(void)drawDashedLineFromPointA: (CGPoint)pointA pointB:(CGPoint)pointB {
    
    UIBezierPath * path = [[UIBezierPath alloc] init];
    [path moveToPoint:pointA];
    [path addLineToPoint:pointB];
    [path setLineWidth:1.0];
    CGFloat dashes[] = { path.lineWidth * 4, path.lineWidth * 4 };
    [path setLineDash:dashes count:2 phase:0];
    [[UIColor colorWithRed:155.0/255.0f green:155.0/255.0f blue:155.0/255.0f alpha:1.0f] setStroke];
    [path stroke];

}

@end
