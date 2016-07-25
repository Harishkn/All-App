//
//  ViewController.m
//  SearchBarUsingSession
//
//  Created by test on 5/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
- (IBAction)cancelButton:(id)sender;
@property (strong, nonatomic) NSDictionary *podcast;
@property (strong, nonatomic) NSMutableArray *podcasts;

@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) NSURLSessionDataTask *dataTask;



@end

@implementation ViewController
static NSString *SearchCell = @"SearchCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadPodcast];
    
    // Add Observer
    [[NSUserDefaults standardUserDefaults] addObserver:self forKeyPath:@"MTPodcast" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableVie
{
    return self.podcasts ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.podcasts ? self.podcasts.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SearchCell forIndexPath:indexPath];
    
    // Fetch Podcast
    NSDictionary *podcast = [self.podcasts objectAtIndex:indexPath.row];
    
    // Configure Table View Cell
    [cell.textLabel setText:[podcast objectForKey:@"collectionName"]];
    [cell.detailTextLabel setText:[podcast objectForKey:@"artistName"]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}


- (IBAction)cancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSURLSession *)session {
    if (!_session) {
        // Initialize Session Configuration
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        // Configure Session Configuration
        [sessionConfiguration setHTTPAdditionalHeaders:@{ @"Accept" : @"application/json" }];
        
        // Initialize Session
        _session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    }
    
    return _session;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (!searchText) return;
    
    if (searchText.length <= 3) {
        [self resetSearch];
        
    } else {
        [self performSearch];
    }
}

- (void)resetSearch {
    // Update Data Source
    [self.podcasts removeAllObjects];
    
    // Update Table View
    [self.tableView reloadData];
}

- (void)performSearch {
    NSString *query = self.searchBar.text;
    
    if (self.dataTask) {
        [self.dataTask cancel];
    }
    
    self.dataTask = [self.session dataTaskWithURL:[self urlForQuery:query] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            if (error.code != -999) {
                NSLog(@"%@", error);
            }
            
        } else {
            NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSArray *results = [result objectForKey:@"results"];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (results) {
                    [self processResults:results];
                }
            });
        }
    }];
    
    if (self.dataTask) {
        [self.dataTask resume];
    }
}

- (NSURL *)urlForQuery:(NSString *)query {
    query = [query stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/search?media=podcast&entity=podcast&term=%@", query]];
}

- (void)processResults:(NSArray *)results {
    if (!self.podcasts) {
        self.podcasts = [NSMutableArray array];
    }
    
    // Update Data Source
    [self.podcasts removeAllObjects];
    [self.podcasts addObjectsFromArray:results];
    
    // Update Table View
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Fetch Podcast
    NSDictionary *podcast = [self.podcasts objectAtIndex:indexPath.row];
    
    // Update User Defatuls
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:podcast forKey:@"MTPodcast"];
    [ud synchronize];
    
    // Dismiss View Controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Show Keyboard
    [self.searchBar becomeFirstResponder];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.searchBar isFirstResponder]) {
        [self.searchBar resignFirstResponder];
    }
}

- (void)loadPodcast {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    self.podcast = [ud objectForKey:@"MTPodcast"];
}

- (void)setPodcast:(NSDictionary *)podcast {
    if (_podcast != podcast) {
        _podcast = podcast;
        
        // Update View
        [self updateView];
    }
}
- (void)updateView {
    // Update View
    self.title = [self.podcast objectForKey:@"collectionName"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"MTPodcast"]) {
        self.podcast = [object objectForKey:@"MTPodcast"];
    }
}
- (void)dealloc {
    [[NSUserDefaults standardUserDefaults] removeObserver:self forKeyPath:@"MTPodcast"];
}
@end
