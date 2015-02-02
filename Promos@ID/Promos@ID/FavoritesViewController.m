//
//  FavoritesViewController.m
//  Promos@ID
//
//  Created by Farandi Kusumo on 2/1/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

@import CoreData;
#import "FavoritesViewController.h"

@interface FavoritesViewController ()
@property (strong) NSMutableArray *promos;
@end

@implementation FavoritesViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.title = @"Favorites Promo";
	
	//Fetch data from CoreData
	NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Promo"];
	self.promos = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return self.promos.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	PromoViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PromoCell" forIndexPath:indexPath];
	NSManagedObject *promo = [self.promos objectAtIndex:indexPath.item];
	
	CGRect rectReference = cell.bounds;
	
	PNCollectionCellBackgroundView* backgroundView = [[PNCollectionCellBackgroundView alloc] initWithFrame:rectReference];
	cell.backgroundView = backgroundView;
	
	UIView* selectedBackgroundView = [[UIView alloc] initWithFrame:rectReference];
	selectedBackgroundView.backgroundColor = [UIColor clearColor];   // no indication of selection
	cell.selectedBackgroundView = selectedBackgroundView;
	
	[cell.poster setImage:[UIImage imageNamed:[promo valueForKey:@"poster_small"]]];
	[cell.title setText:[promo valueForKey:@"title"]];
	[cell.brand setText:[promo valueForKey:@"brand"]];
	[cell.brandLogo_small setImage:[UIImage imageNamed:[promo valueForKey:@"brand_logo"]]];
	return cell;
}

#pragma mark - UICollectionViewDelegate

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	NSManagedObject *promo = [self.promos objectAtIndex:indexPath.item];

	UIImage *image;
	image = [UIImage imageNamed:[promo valueForKey:@"poster_small"]];
	CGSize size = CGSizeMake(self.view.frame.size.width / 2.2, image.size.height + 80);
	return size;
}



- (NSManagedObjectContext *)managedObjectContext
{
	NSManagedObjectContext *context = nil;
	id delegate = [[UIApplication sharedApplication] delegate];
	if ([delegate performSelector:@selector(managedObjectContext)]) {
		context = [delegate managedObjectContext];
	}
	return context;
}

@end
