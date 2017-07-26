//
//  OrderFooterView.h
//  ChocoTravelTest
//
//  Created by Yerlan Ismailov on 25.07.17.
//  Copyright © 2017 ismailov.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderFooterView : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UIImageView *orderStatusImageView;
@property (weak, nonatomic) IBOutlet UILabel *orderStatusLabel;


@end
