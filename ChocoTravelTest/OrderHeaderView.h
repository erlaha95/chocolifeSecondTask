//
//  OrderHeaderView.h
//  ChocoTravelTest
//
//  Created by Yerlan Ismailov on 25.07.17.
//  Copyright © 2017 ismailov.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderHeaderView : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UILabel *orderNumberLabel;

@property (weak, nonatomic) IBOutlet UILabel *orderDateLabel;

@property (weak, nonatomic) IBOutlet UIImageView *orderImageView;


@end
