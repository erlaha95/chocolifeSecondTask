//
//  PassengerHeaderView.m
//  ChocoTravelTest
//
//  Created by Yerlan Ismailov on 26.07.17.
//  Copyright © 2017 ismailov.com. All rights reserved.
//

#import "PassengerHeaderView.h"

@implementation PassengerHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self) {
        self = [super initWithFrame:frame];
        [self setupViews];
    }
    return self;
}

-(void)setupViews {
    self.contentView.backgroundColor = [UIColor colorWithRed:158.0/255.0 green:163.0/255.0 blue:183.0/255.0 alpha:1.0];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.titleLabel];
    [self.titleLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:19.0].active = YES;
    [self.titleLabel.heightAnchor constraintEqualToConstant:16.0].active = YES;
    [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:0].active = YES;

}


@end
