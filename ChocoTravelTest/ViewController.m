//
//  ViewController.m
//  ChocoTravelTest
//
//  Created by Yerlan Ismailov on 25.07.17.
//  Copyright © 2017 ismailov.com. All rights reserved.
//

#import "ViewController.h"
#import "OrderCell.h"
#import "OrderHeaderView.h"
#import "OrderFooterView.h"
#import "OrderDetailVC.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController {
    NSArray *orders;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self registerCustomViews];
    
    [self setupNavBar];
    
    NSDictionary *order1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"ticket", @"icon", @"done", @"statusImage", @"Оформлен", @"statusText",  nil];
    
    NSDictionary *order2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"bag", @"icon", @"cancel", @"statusImage", @"Ошибка оформления", @"statusText",  nil];
    
    NSDictionary *order3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"shield", @"icon", @"time", @"statusImage", @"Ожидается подтверждение...", @"statusText",  nil];
    
    orders = [[NSArray alloc] initWithObjects:order1, order2, order3, nil];
}


#pragma maerk - custom methods
-(void)setupNavBar {
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"bulleted_list"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
}

-(void) registerCustomViews {
    // Registering OrderCell nib
    [self.tableView registerNib:[UINib nibWithNibName:@"OrderCell" bundle:nil] forCellReuseIdentifier:@"OrderCell"];
    
    // Registering OrderHeaderView nib
    [self.tableView registerNib:[UINib nibWithNibName:@"OrderHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"OrderHeaderView"];
    
    // Registering OrderFooterView nib
    [self.tableView registerNib:[UINib nibWithNibName:@"OrderFooterView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"OrderFooterView"];
    
}

#pragma mark - UITableViewDelegate methods
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 60;
}

#pragma mark - UITableViewDatasource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 3;
    }
    
    return 2;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OrderDetailVC *vc = [[OrderDetailVC alloc] init];
    [self showViewController:vc sender:nil];
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    OrderHeaderView *headerView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"OrderHeaderView"];
    
    headerView.orderImageView.image = [UIImage imageNamed:orders[section][@"icon"]];
    
    return headerView;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    OrderFooterView *footerView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"OrderFooterView"];
    
    footerView.orderStatusLabel.text = orders[section][@"statusText"];
    footerView.orderStatusImageView.image = [UIImage imageNamed:orders[section][@"statusImage"]];
    
    switch (section) {
        case 0:
            footerView.orderStatusLabel.textColor = [UIColor colorWithRed:76/255 green:175/255 blue:80/255 alpha:1];
            
            break;
        case 1:
            footerView.orderStatusLabel.textColor = [UIColor colorWithRed:255/255 green:65/255 blue:50/255 alpha:1];
            
            break;
        case 2:
            footerView.orderStatusLabel.textColor = [UIColor colorWithRed:82/255 green:143/255 blue:200/255 alpha:1];
            
            break;
        default:
            break;
    }
    
    return footerView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OrderCell *orderCell = [self.tableView dequeueReusableCellWithIdentifier:@"OrderCell"];
    
    return orderCell;
    
}

@end
