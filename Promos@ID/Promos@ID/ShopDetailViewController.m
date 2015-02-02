//
//  ShopDetailViewController.m
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/22/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "ShopDetailViewController.h"
#import "Venue.h"
#import "VenueDetailViewController.h"

@interface ShopDetailViewController ()

@end

@implementation ShopDetailViewController{
	NSArray *venues;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.shop.name;
    self.thumbnailShop.image = [UIImage imageNamed:self.shop.image];
    self.locationMallLabel.text = [NSString stringWithFormat:@"at %@",[self.shop.location objectAtIndex:0]];
    self.webLabel.text = self.shop.web;
	
	[self initiateVariable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *cellIdentifier = @"BranchCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	}
	
	Venue *venue = nil;
	venue = [venues objectAtIndex:indexPath.row];
	
	cell.textLabel.text = venue.name;
	return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [venues count];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"showVenueDetail"]) {
		NSIndexPath *indexPath = nil;
		Venue *venue = nil;
		
		indexPath = [self.tableBranch indexPathForSelectedRow];
		venue = [venues objectAtIndex:indexPath.row];
		
		VenueDetailViewController *destViewController = segue.destinationViewController;
		destViewController.venue = venue;
	}
}


- (IBAction)segmentedValueChanged:(UISegmentedControl *)sender {
	switch (sender.selectedSegmentIndex) {
		case 0:
			self.tableBranch.hidden = NO;
			break;
		case 1:
			self.tableBranch.hidden = YES;
			break;
		default:
			break;
	}

}


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

@end
