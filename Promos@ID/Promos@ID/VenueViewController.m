//
//  SecondViewController.m
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/16/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "VenueViewController.h"
#import "Venue.h"
#import "VenueDetailViewController.h"
#import "UITabBarController+hidable.h"

@interface VenueViewController ()

@end

@implementation VenueViewController{
    NSArray *venues;
    NSArray *searchResults;
    NSDictionary *venueDict;
	CGFloat startContentOffset;
	CGFloat lastContentOffset;
	BOOL hidden;
}
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initiateVariable];
	hidden = NO;
	
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

//-(void)viewWillAppear:(BOOL)animated
//{
//	[super viewWillAppear:animated];
//	
//	[self.navigationController setNavigationBarHidden:hidden
//											 animated:YES];
//	
//}
//
//-(void)viewDidAppear:(BOOL)animated
//{
//	[super viewDidAppear:animated];
//	[self.tabBarController setTabBarHidden:hidden
//								  animated:NO];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Delegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"VenueCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //Display Venue in the table cell
    Venue *venue = nil;
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        venue = [searchResults objectAtIndex:indexPath.row];
    } else{
        venue = [venues objectAtIndex:indexPath.row];
    }
    cell.textLabel.text = venue.name;
//    cell.imageView.image = [UIImage imageNamed:venue.image];
    return  cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    }
    else {
        return [venues count];
    }
}

#pragma mark - search method

-(void)filterContentForSearchText:(NSString *)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    searchResults = [venues filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;
}

#pragma mark - segue initialization for navigation


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showVenueDetail"]) {
        NSIndexPath *indexPath = nil;
        Venue *venue = nil;
        
        if(self.searchDisplayController.active)
        {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            venue = [searchResults objectAtIndex:indexPath.row];
        } else
        {
            indexPath = [self.tableView indexPathForSelectedRow];
            venue = [venues objectAtIndex:indexPath.row];
        }

        VenueDetailViewController *destViewController = segue.destinationViewController;
        destViewController.venue = venue;
    }
}

#pragma mark - initial dummy variable

-(void)initiateVariable
{
    Venue *kelapa_gading = [Venue new];
    kelapa_gading.name = @"Mall Kelapa Gading";
    kelapa_gading.location = @"Jakarta Utara";
    kelapa_gading.image = @"kelapa_gading_mall.png";
    kelapa_gading.map = nil;
    kelapa_gading.store = nil;
    
    Venue *pondok_indah = [Venue new];
    pondok_indah.name = @"Pondok Indah Mall";
    pondok_indah.location = @"Jakarta Selatan";
    pondok_indah.image = @"pondok_indah_mall.png";
    pondok_indah.map = nil;
    pondok_indah.store = nil;
    
    Venue *grand_indonesia = [Venue new];
    grand_indonesia.name = @"Grand Indonesia Shopping Town";
    grand_indonesia.location = @"Jakarta Pusat";
    grand_indonesia.image = @"grand_indonesia.png";
    grand_indonesia.map = nil;
    grand_indonesia.store = nil;
    
    venues = [NSArray arrayWithObjects:kelapa_gading,pondok_indah,grand_indonesia, nil];
}
//
//#pragma mark - Hide TabBar and NavBar
//
//-(void)expand
//{
//	if(hidden)
//		return;
//	
//	hidden = YES;
//	
//	[self.tabBarController setTabBarHidden:YES
//								  animated:YES];
//	
//	[self.navigationController setNavigationBarHidden:YES
//											 animated:YES];
//}
//
//-(void)contract
//{
//	if(!hidden)
//		return;
//	
//	hidden = NO;
//	
//	[self.tabBarController setTabBarHidden:NO
//								  animated:YES];
//	
//	[self.navigationController setNavigationBarHidden:NO
//											 animated:YES];
//}
//
//#pragma mark UIScrollViewDelegate Methods
//
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
//	startContentOffset = lastContentOffset = scrollView.contentOffset.y;
//	//NSLog(@"scrollViewWillBeginDragging: %f", scrollView.contentOffset.y);
//}
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//	CGFloat currentOffset = scrollView.contentOffset.y;
//	CGFloat differenceFromStart = startContentOffset - currentOffset;
//	CGFloat differenceFromLast = lastContentOffset - currentOffset;
//	lastContentOffset = currentOffset;
//	
//	
//	
//	if((differenceFromStart) < 0)
//	{
//		// scroll up
//		if(scrollView.isTracking && (abs(differenceFromLast)>1))
//			[self expand];
//	}
//	else {
//		if(scrollView.isTracking && (abs(differenceFromLast)>1))
//			[self contract];
//	}
//	
//}
//- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
//{
//	[self contract];
//	return YES;
//}
//
//

@end
