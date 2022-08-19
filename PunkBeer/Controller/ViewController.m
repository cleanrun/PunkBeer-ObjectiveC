//
//  ViewController.m
//  PunkBeer
//
//  Created by cleanmac-ada on 19/08/22.
//

#import "ViewController.h"
#import "Webservice.h"
#import "Beer.h"
#import "BeerCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@property (strong, nonatomic) NSArray<Beer *> *beers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}

- (void) setupTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UINib *beerCell = [UINib nibWithNibName:@"BeerCell" bundle:nil];
    [self.tableView registerNib:beerCell forCellReuseIdentifier: BeerCell.CELL_IDENTIFIER];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshAction) forControlEvents:UIControlEventValueChanged];
    self.tableView.refreshControl = self.refreshControl;
    
    [self retrieveBeerData];
}

- (void) retrieveBeerData {
    [[Webservice shared] getBeers:^(NSArray<Beer *> *data) {
        self.beers = data;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

- (void) refreshAction {
    [self retrieveBeerData];
    [self.refreshControl endRefreshing];
}

#pragma mark Table view delegate and data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.beers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BeerCell *cell = [tableView dequeueReusableCellWithIdentifier:BeerCell.CELL_IDENTIFIER];
    Beer *beer = self.beers[indexPath.row];
    [cell setupContents:beer];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return BeerCell.CELL_HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end


