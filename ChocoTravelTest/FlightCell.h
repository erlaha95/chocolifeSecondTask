//
//  FlightCell.h
//  ChocoTravelTest
//
//  Created by Yerlan Ismailov on 25.07.17.
//  Copyright © 2017 ismailov.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlightCell : UITableViewCell

@property (nonatomic) BOOL isFinal;

@property (weak, nonatomic) IBOutlet UIView *topLine;

@property (weak, nonatomic) IBOutlet UIView *bottomLine;

@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;

-(void)changeCellState;

@end
