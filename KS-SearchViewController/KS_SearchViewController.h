//
//  KS_SearchViewController.h
//  KS-SearchViewController
//
//  Created by Kasey Schindler on 2/27/12.
//  Copyright (c) 2012 Kasey Schindler. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KS_SearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (strong, nonatomic) UITableView *theTableView;
@property (strong, nonatomic) UISearchBar *theSearchBar;
@property (strong, nonatomic) NSMutableArray *objects;

@end