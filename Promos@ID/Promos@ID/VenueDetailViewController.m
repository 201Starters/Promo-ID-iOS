//
//  VenueDetailViewController.m
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/21/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "VenueDetailViewController.h"
#import "Promo.h"
#import "Shop.h"
#import "ShopDetailViewController.h"
#import "PromoDetailViewController.h"

@interface VenueDetailViewController ()
@property (strong,nonatomic) UITableView *tableView;
@end

@implementation VenueDetailViewController
{
	NSArray *promos;
	NSArray *shops;
}
@synthesize tableContent;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.venue.name;
    self.addressLabel.textColor = [UIColor whiteColor];
    self.addressLabel.text = self.venue.location;
    self.imageMall.image = [UIImage imageNamed:self.venue.image];

	[self initiateVariable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"showStoreDetail"]) {
		NSIndexPath *indexPath = nil;
		Shop *shop = nil;
		
		indexPath = [self.tableContent indexPathForSelectedRow];
		shop = [shops objectAtIndex:indexPath.row];
		
		ShopDetailViewController *destViewController = segue.destinationViewController;
		destViewController.shop = shop;
	} else if ([segue.identifier isEqualToString:@"showPromoDetail"]){
		NSIndexPath *indexPath = nil;
		Promo *promo = nil;
		
		indexPath = [[self.collectionPromo indexPathsForSelectedItems]lastObject];
		promo = [promos objectAtIndex:indexPath.item];
		
		PromoDetailViewController *destViewController = segue.destinationViewController;
		destViewController.promo = promo;
	}
}


#pragma mark - UITableViewDataSource and UITableViewDelegate Implementation

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [shops count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *cellIdentifier = @"StoreCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
	
	if (cell==nil) {
		cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
		NSLog(@"in");
	}
	
	Shop *shop = nil;
	shop = [shops objectAtIndex:indexPath.row];
	cell.textLabel.text = shop.name;
	return cell;
}


#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return [promos count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	PromoViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PromoCell" forIndexPath:indexPath];
	Promo *promo = nil;
	promo = [promos objectAtIndex:indexPath.item];
	
	CGRect rectReference = cell.bounds;
	
	PNCollectionCellBackgroundView* backgroundView = [[PNCollectionCellBackgroundView alloc] initWithFrame:rectReference];
	cell.backgroundView = backgroundView;
	
	UIView* selectedBackgroundView = [[UIView alloc] initWithFrame:rectReference];
	selectedBackgroundView.backgroundColor = [UIColor clearColor];   // no indication of selection
	cell.selectedBackgroundView = selectedBackgroundView;
	
	cell.poster.image = [UIImage imageNamed:promo.poster_small];
	cell.title.text = promo.title;
	cell.brand.text = promo.brand;
	cell.brandLogo_small.image = [UIImage imageNamed:promo.brand_logo];
	return cell;
}

#pragma mark - UICollectionViewDelegate

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	Promo *promo = nil;
	promo = [promos objectAtIndex:indexPath.item];
	UIImage *image;
	image = [UIImage imageNamed:promo.poster_small];
	CGSize size = CGSizeMake(self.view.frame.size.width / 2.2, image.size.height + 80);
	return size;
}







// Segmented Control - Change View

- (IBAction)segmentedValueChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.tableContent.hidden = YES;
			self.collectionPromo.hidden = NO;
            break;
        case 1:
            self.tableContent.hidden = NO;
			self.collectionPromo.hidden = YES;
            break;
        case 2:
            self.tableContent.hidden = YES;
			self.collectionPromo.hidden = YES;
            break;
        default:
            break;
    }
}

//Initiate Dummy Variable

-(void)initiateVariable
{
	Promo *etude_EOYSale    = [Promo new];
	etude_EOYSale.title     = @"Etude End of Year Sale";
	etude_EOYSale.brand     = @"";
	etude_EOYSale.brand_logo= @"etudeEOYSale.png";
	etude_EOYSale.shop      = [NSArray arrayWithObjects:@"", nil];
	etude_EOYSale.location  = [NSArray arrayWithObjects:@"", nil];
	etude_EOYSale.poster_small= @"etudeEOYSale.png";
	etude_EOYSale.poster_big  = @"";
	etude_EOYSale.desc      = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum";
	
	Promo *mandiri_discount = [Promo new];
	mandiri_discount.title = @"Mandiri Discount";
	mandiri_discount.brand     = @"";
	mandiri_discount.brand_logo= @"mandiriDiscount.png";
	mandiri_discount.shop      = [NSArray arrayWithObjects:@"", nil];
	mandiri_discount.location  = [NSArray arrayWithObjects:@"", nil];
	mandiri_discount.poster_small= @"mandiriDiscount.png";
	mandiri_discount.poster_big  = @"";
	mandiri_discount.desc      = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum";
	
	
	Promo *cinema21_promo = [Promo new];
	cinema21_promo.title = @"Cinema 21 Promo";
	cinema21_promo.brand     = @"";
	cinema21_promo.brand_logo= @"promo2.png";
	cinema21_promo.shop      = [NSArray arrayWithObjects:@"", nil];
	cinema21_promo.location  = [NSArray arrayWithObjects:@"", nil];
	cinema21_promo.poster_small= @"promo2.png";
	cinema21_promo.poster_big  = @"";
	cinema21_promo.desc      = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum";
	
	Promo *testing_promo = [Promo new];
	testing_promo.title = @"Testing Promo";
	testing_promo.brand     = @"";
	testing_promo.brand_logo= @"grand_indonesia.png";
	testing_promo.shop      = [NSArray arrayWithObjects:@"", nil];
	testing_promo.location  = [NSArray arrayWithObjects:@"", nil];
	testing_promo.poster_small= @"grand_indonesia.png";
	testing_promo.poster_big  = @"";
	testing_promo.desc      = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum";
	
	promos = [NSArray arrayWithObjects:etude_EOYSale,mandiri_discount,cinema21_promo, testing_promo, nil];
	
	
	Shop *iBox = [Shop new];
	iBox.name = @"iBox";
	iBox.location = [NSArray arrayWithObjects:@"Mall Kelapa Gading",@"Pondok Indah Mall",nil];
	iBox.image = @"ibox.png";
	iBox.web = @"ibox.co.id";
	
	Shop *uniqlo = [Shop new];
	uniqlo.name = @"Uniqlo";
	uniqlo.location = [NSArray arrayWithObjects:@"Pondok Indah Mall",@"Grand Indonesia Shopping Town", nil];
	uniqlo.image = @"uniqlo.png";
	uniqlo.web = @"uniqlo.com";
	
	Shop *zara = [Shop new];
	zara.name = @"ZARA";
	zara.location = [NSArray arrayWithObjects:@"Grand Indonesia Shopping Town",@"Mall Kelapa Gading", nil];
	zara.image = @"zara.png";
	zara.web = @"zara.com";
	
	shops = [NSArray arrayWithObjects:iBox,uniqlo,zara, nil];

}


@end
