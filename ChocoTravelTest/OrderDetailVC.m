//
//  OrderDetailVC.m
//  ChocoTravelTest
//
//  Created by Yerlan Ismailov on 25.07.17.
//  Copyright © 2017 ismailov.com. All rights reserved.
//

#import "OrderDetailVC.h"
#import "OrderDetailHeaderView.h"
#import "FlightCell.h"
#import "PassengerHeaderView.h"
#import "PassengerCell.h"
#import "BookCell.h"
#import "RefundExchangeHeaderView.h"
#import "OrderCell.h"
#import "RefundExchangeCell.h"

@interface OrderDetailVC ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation OrderDetailVC

-(instancetype)init {
    
    if (self) {
        self = [self initWithNibName:@"OrderDetailVC" bundle:nil];
    }
    return self;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // Header Views
    [self.tableView registerNib:[UINib nibWithNibName:@"OrderDetailHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"OrderDetailHeaderView"];
    [self.tableView registerClass:[PassengerHeaderView class] forHeaderFooterViewReuseIdentifier:@"PassengerHeaderView"];
    [self.tableView registerClass:[RefundExchangeHeaderView class] forHeaderFooterViewReuseIdentifier:@"RefundExchangeHeaderView"];
    
    // Cells
    [self.tableView registerNib:[UINib nibWithNibName:@"FlightCell" bundle:nil] forCellReuseIdentifier:@"FlightCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"PassengerCell" bundle:nil] forCellReuseIdentifier:@"PassengerCell"];
    [self.tableView registerClass:[BookCell class] forCellReuseIdentifier:@"BookCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"RefundExchangeCell" bundle:nil] forCellReuseIdentifier:@"RefundExchangeCell"];
    
    [self setupNavBar];
    
}

-(void)backButtonTapped {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)setupNavBar {
    
    // left items
    UIBarButtonItem *backBarBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonTapped)];
    
    self.navigationItem.leftBarButtonItem = backBarBtn;
    
    
    // title view
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    titleLabel.text = @"Детали заказа №354256";
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = titleLabel;
    
    
    // bg color
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:82.0/255.0f green:143.0/255.0f blue:200.0/255.0f alpha:1.0f];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:82.0/255.0f green:143.0/255.0f blue:200.0/255.0f alpha:1.0f];
    
    [self.navigationController.navigationBar setTranslucent:NO];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}



#pragma mark - UITableViewDataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger rows = 0;
    
    switch (section) {
        case 0:
            rows = 2;
            break;
        case 1:
            rows = 2;
            break;
        case 2:
            rows = 1;
            break;
        case 3:
            rows = 2;
            break;
        default:
            rows = 0;
            break;
    }
    
    return rows;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id cell = [UITableViewCell new];
    switch (indexPath.section) {
        case 0:
            cell = (FlightCell*)[self.tableView dequeueReusableCellWithIdentifier:@"FlightCell"];
            if (indexPath.row == 1) {
                [(FlightCell*)cell setIsFinal:YES];
                [(FlightCell*)cell changeCellState];
            }
            
            break;
        case 1:
            cell = (PassengerCell*)[self.tableView dequeueReusableCellWithIdentifier:@"PassengerCell"];
            break;
        case 2:
            cell = [[BookCell alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
            [[cell titleLabel] setText:@"L2SADB"];
            break;
        case 3:
            cell = (RefundExchangeCell*)[self.tableView dequeueReusableCellWithIdentifier:@"RefundExchangeCell"];
            break;
        default:
            break;
    }
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    id headerView = [UITableViewHeaderFooterView new];
    
    switch (section) {
        case 0:
            headerView = (OrderDetailHeaderView *)[self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"OrderDetailHeaderView"];
            break;
        case 1:
            headerView = [[PassengerHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 29)];
            [[headerView titleLabel] setText:@"Пассажиры"];
            break;
        
        case 2:
            headerView = [[PassengerHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 29)];
            [[headerView titleLabel] setText:@"№ бронирования"];
            break;
        case 3:
            headerView = [[RefundExchangeHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
            break;
        default:
            break;
    }
    
    
//    OrderDetailHeaderView *headerView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"OrderDetailHeaderView"];
//    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 1 || section == 2) {
        return 29;
    } else if (section == 3) {
        return 50;
    }
    
    return 180 + 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger height = 0;
    
    switch (indexPath.section) {
        case 0:
            height = 250;
            break;
        case 1:
            height = 40;
            break;
        case 2:
            height = 60;
            break;
        case 3:
            height = 186;
            break;
        default:
            break;
    }
    
    return height;
}










@end
