//
//  FISReposTableViewController.m
//  
//
//  Created by Joe Burgess on 5/5/14.
//
//

#import "FISReposTableViewController.h"
#import "FISReposDataStore.h"
#import <AFNetworking.h>

@interface FISReposTableViewController ()

@property (strong, nonatomic) NSArray *repos;
@property (strong, nonatomic) UITextField *searchField;

@end

@implementation FISReposTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.accessibilityIdentifier = @"Repo Table View";
    self.tableView.accessibilityLabel=@"Repo Table View";
    
    FISReposDataStore *dataStore = [FISReposDataStore sharedDataStore];
    

    
    
    [dataStore refreshReposWithCompletion:^(BOOL succeeded) {
        self.repos = dataStore.repositories;
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    
    }];    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.repos.count;
    // Return the number of rows in the section.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    FISGithubRepository *repo = self.repos[indexPath.row];
    
    cell.textLabel.text = repo.fullName;
    
    return cell;
}

- (IBAction)searchTapped:(id)sender {
    UIAlertController *searchAlert = [UIAlertController alertControllerWithTitle:@"Search" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [searchAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"search terms";
    }];
    UIAlertAction *search = [UIAlertAction actionWithTitle:@"Search" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        FISReposDataStore *dataStore = [FISReposDataStore sharedDataStore];
        [dataStore searchReposWithCompletion:[searchAlert.textFields[0] text] completion:^(BOOL completion) {
            [self.tableView reloadData];
        }];
    }];
    [searchAlert addAction:search];
    [self presentViewController:searchAlert animated:YES completion:nil];
    
    
    
}

@end
