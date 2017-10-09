//
//  SCHomeViewController.m
//  AroundClient
//
//  Created by Yikun Huang on 10/4/17.
//  Copyright © 2017 Yikun Huang. All rights reserved.
//

#import "SCHomeViewController.h"
#import "SCHomeTableViewCell.h"
#import "SCPost.h"
#import "SCLocationManager.h"
#import <MapKit/MapKit.h>

static NSString * const SCHomeCellIdentifier = @"SCHomeCellIdentifier";

@interface SCHomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray<SCPost *> *posts;
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;


@end

@implementation SCHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTableView];
    
    // load data
    [self loadPosts];
    
    // load UI
    [self setupUI];
    
    // request location access
    [self updateLocation];
    
    // add observer
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadPosts) name:SCLocationUpdateNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

#pragma mark -- public
- (void)loadResultPageWithPosts:(NSArray <SCPost *>*)posts
{
    self.posts = posts;
    [self.tableView reloadData];
}

#pragma mark -- private

- (void)updateLocation
{
    if (![SCLocationManager isLocationServicesEnabled]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Location Required", nil) message:NSLocalizedString(@"Location is required for this app", nil) preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            NSLog(@"OK");
        }];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else {
        SCLocationManager *locationManager  = [SCLocationManager sharedManager];
        [locationManager startLoadUserLocation];
    }
}

- (void)updateUserLocation
{
    [self loadPosts];
}

#pragma mark - UI
- (void)setupUI
{
    [self setupTableView];
    [self setupNavigationBarUI];
}

- (void)setupTableView
{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SCHomeTableViewCell class]) bundle:nil] forCellReuseIdentifier:SCHomeCellIdentifier];
}

- (void)setupNavigationBarUI
{
    self.title = NSLocalizedString(@"Home", nil);
    self.navigationController.navigationBar.tintColor = [UIColor darkTextColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"PostEvent"] style:UIBarButtonItemStyleDone target:self action:@selector(showCreatePostPage)];
}

#pragma mark - action
- (void)showCreatePostPage
{
    // TODO
}

#pragma mark - API
- (void)loadPosts
{
    SCPost *post1 = [SCPost new];
    post1.username = @"Jonathan";
    post1.message = @"Hi, my name is Jonathan.";
    SCPost *post2 = [SCPost new];
    post2.username = @"Steve";
    post2.message = @"Hi, nice to meet you!";
    SCPost *post3 = [SCPost new];
    post3.username = @"Jorge";
    post3.message = @"Do we have class today?";
    self.posts = @[post1, post2, post3];
    [self.tableView reloadData];
}

#pragma mark - SCCreatePostViewControllerDelegate
- (void)didCreatePost
{
    [self loadPosts];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCHomeTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:SCHomeCellIdentifier forIndexPath:indexPath];
    [cell loadCellWithPost:self.posts[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [SCHomeTableViewCell cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO
}
@end
