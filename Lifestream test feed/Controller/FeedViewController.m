//
//  FeedViewController.m
//  Lifestream test feed
//
//  Created by Vadym Patalakh on 11/10/18.
//

#import "FeedViewController.h"
#import "DownloadManager.h"
#import "FeedTableViewCell.h"
#import "DataParser.h"

@interface FeedViewController () <UITableViewDataSource, DownloadManagerDelegate>

@property (weak, nonatomic) IBOutlet    UITableView         *feedTableView;

@property (nonatomic)                   DownloadManager     *downloadManager;
@property (nonatomic)                   NSArray<Post *>     *tableViewData;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.downloadManager = [[DownloadManager alloc] initWithDelegate:self];
    UINib *nib = [UINib nibWithNibName:[FeedTableViewCell nibName] bundle:nil];
    [self.feedTableView registerNib:nib forCellReuseIdentifier:[FeedTableViewCell reusableIdentifier]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.downloadManager getData];
}

#pragma mark - Table view data source

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    FeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[FeedTableViewCell reusableIdentifier]];
    
    [cell setRepresentedObject:self.tableViewData[indexPath.row]];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableViewData.count;
}

#pragma mark - Download manager delegate

- (void)downloadManagerDidGetData:(NSData *)data {
    DataParser *parser = [DataParser new];
    [parser parseData:data withCompletionHandler:^(BOOL success, NSArray<Post *> *posts) {
        if (success) {
            self.tableViewData = posts;
            [self.feedTableView reloadData];
        } else {
            // show alert here
        }
    }];
}

- (void)couldNotDownloadData {
    // show alert here
}

@end
