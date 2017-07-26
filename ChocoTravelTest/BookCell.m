//
//  BookCell.m
//  ChocoTravelTest
//
//  Created by Yerlan Ismailov on 26.07.17.
//  Copyright © 2017 ismailov.com. All rights reserved.
//

#import "BookCell.h"

@implementation BookCell

-(instancetype)initWithFrame:(CGRect)frame {
    if (self) {
        self = [super initWithFrame:frame];
        
        [self setupViews];
    }
    
    return self;
}

-(UITableViewCellSelectionStyle)selectionStyle {
    return UITableViewCellSelectionStyleNone;
}

-(void)setupViews {
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = [UIColor colorWithRed:74.0/255.0 green:74.0/255.0 blue:74.0/255.0 alpha:1.0];
    
    [self addSubview:self.titleLabel];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.titleLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:19.0].active = YES;
    [self.titleLabel.heightAnchor constraintEqualToConstant:30].active = YES;
    [self.titleLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:20].active = YES;
    [self.titleLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:15].active = YES;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
