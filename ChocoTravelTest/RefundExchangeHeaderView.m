//
//  RefundExchangeHeaderView.m
//  ChocoTravelTest
//
//  Created by Yerlan Ismailov on 26.07.17.
//  Copyright © 2017 ismailov.com. All rights reserved.
//

#import "RefundExchangeHeaderView.h"

@implementation RefundExchangeHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self) {
        self = [super initWithFrame:frame];
        [self setupViews];
    }
    
    return self;
}

-(void)setupViews {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"СПИСОК ВОЗВРАТОВ И ОБМЕНА";
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = [UIColor colorWithRed:33.0/255.0 green:44.0/255.0 blue:91.0/255.0 alpha:1.0];
    [self addSubview:self.titleLabel];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [self.titleLabel.heightAnchor constraintEqualToConstant:19.0].active = YES;
}


@end
