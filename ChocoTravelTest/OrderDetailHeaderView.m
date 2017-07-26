//
//  OrderDetailHeaderView.m
//  ChocoTravelTest
//
//  Created by Yerlan Ismailov on 25.07.17.
//  Copyright © 2017 ismailov.com. All rights reserved.
//

#import "OrderDetailHeaderView.h"

@implementation OrderDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)awakeFromNib {
    
    [super awakeFromNib];
    [self setupViews];
}

-(void)setupViews {
    
    self.contentView.backgroundColor = [UIColor colorWithRed:82.0/255.0 green:143.0/255.0 blue:200.0/255.0 alpha:1.0];
    
    //82,143,200
    self.refundButton.layer.borderWidth = 1;
    self.refundButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.refundButton.layer.cornerRadius = 3;
    self.refundButton.layer.masksToBounds = YES;
    
    
    self.exchangeButton.layer.borderWidth = 1;
    self.exchangeButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.exchangeButton.layer.cornerRadius = 3;
    self.exchangeButton.layer.masksToBounds = YES;
}

@end
