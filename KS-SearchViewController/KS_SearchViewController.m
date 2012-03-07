//
//  KS_SearchViewController.m
//  KS-SearchViewController
//
//  Created by Kasey Schindler on 2/27/12.
//  Copyright (c) 2012 Kasey Schindler. All rights reserved.
//

#import "KS_SearchViewController.h"

@interface KS_SearchViewController () 

@property (strong, nonatomic) UIView *disableViewOverlay;
- (void)searchBar:(UISearchBar *)searchBar activate:(BOOL)active;
- (void)dismissOverlayView;

@end

@implementation KS_SearchViewController

@synthesize theTableView;
@synthesize theSearchBar;
@synthesize objects;
@synthesize disableViewOverlay;

- (void)loadView {
    [super loadView];
    
    // init and add table view
    self.theTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 416)];
    self.theTableView.delegate = self;
    self.theTableView.dataSource = self;
    [self.view addSubview:self.theTableView];
    
    // init and add search bar
    self.theSearchBar = [[UISearchBar alloc] init];
    [self.theSearchBar sizeToFit];
    self.theSearchBar.delegate = self;
    self.theSearchBar.placeholder = @"Search";
    self.theTableView.tableHeaderView = self.theSearchBar;
    
    // init view overlay
	self.disableViewOverlay = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, 320.0f, 416.0f)];
	self.disableViewOverlay.backgroundColor = [UIColor blackColor];
	self.disableViewOverlay.alpha = 0;
    
    // add gesture recognizer to overlay view
    UITapGestureRecognizer *tapOverlay = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissOverlayView)];
    [self.disableViewOverlay addGestureRecognizer:tapOverlay];
}
							
- (void)viewDidLoad {
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"Search View";
}

- (void)viewWillAppear:(BOOL)animated {
    // hide search bar initially
    self.theTableView.contentOffset = CGPointMake(0, self.theSearchBar.frame.size.height);
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    self.theTableView = nil;
    self.theSearchBar = nil;
    self.disableViewOverlay = nil;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.objects count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    NSString *object = [self.objects objectAtIndex:indexPath.row];
    cell.textLabel.text = [object description];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Search Bar Functionality

- (void)dismissOverlayView {
    [self searchBarCancelButtonClicked:self.theSearchBar];
}

- (void)doSearch:(NSString *)searchText {
	// implement search method - i.e. start NSURLConnection for server call
    NSLog(@"Searching for text - %@", searchText);
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
	[self searchBar:searchBar activate:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self doSearch:searchBar.text];
	[self searchBar:searchBar activate:NO];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
	searchBar.text = @"";
    [self searchBar:searchBar activate:NO];
}

- (void)searchBar:(UISearchBar *)searchBar activate:(BOOL)active {
	self.theTableView.allowsSelection = !active;
	self.theTableView.scrollEnabled = !active;
	
	if (!active) {
		[self.disableViewOverlay removeFromSuperview];
		[searchBar resignFirstResponder];
	} else {
		// fading in the overlay
		self.disableViewOverlay.alpha = 0;
		[self.view addSubview:self.disableViewOverlay];
        
		[UIView beginAnimations:@"FadeIn" context:nil];
		[UIView setAnimationDuration:0.5];
		self.disableViewOverlay.alpha = 0.6;
		[UIView commitAnimations];
	}
	[searchBar setShowsCancelButton:active animated:YES];
	[self.navigationController setNavigationBarHidden:active animated:YES];
}

@end
