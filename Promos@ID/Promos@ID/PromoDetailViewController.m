//
//  PromoDetailViewController.m
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/28/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

@import CoreData;
#import "PromoDetailViewController.h"
#import "UITabBarController+hidable.h"

@interface PromoDetailViewController ()
@property (strong) NSMutableArray *promos;
@end

@implementation PromoDetailViewController
{
	BOOL _favorited;
	int _indexFavorited;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	UIImage *poster = nil;
	poster = [UIImage imageNamed:self.promo.poster_small];
	
	
	//self.poster_big.contentMode = UIViewContentModeScaleAspectFit;
	//self.poster_big.clipsToBounds = YES;

	double scale = self.view.frame.size.width / poster.size.width;
	self.poster_big.image = poster;
	
	self.poster_big.frame = CGRectMake(self.poster_big.frame.origin.x, self.poster_big.frame.origin.y, (poster.size.width*scale), (poster.size.height*scale));
	NSLog(@"scale : %f \n width poster : %f \n height poster: %f \n width imageView: %f \n height imageView :%f",scale,poster.size.width,poster.size.height,self.poster_big.frame.size.width,self.poster_big.frame.size.height);
	
	
	self.brandLogo.image = [UIImage imageNamed:self.promo.brand_logo];
	self.titleLabel.numberOfLines = 10;
	self.titleLabel.frame = CGRectMake(self.titleLabel.frame.origin.x
									   , self.titleLabel.frame.origin.y
									   , self.poster_big.frame.size.width
									   , 80);
	self.titleLabel.text = self.promo.title;
	self.descriptionLabel.text = self.promo.desc;
	
	self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
	
	[self.favoriteButton setFrame:CGRectMake(self.favoriteButton.frame.origin.x, self.favoriteButton.frame.origin.y, 30, 30)];
	[self.favoriteButton setImage:[UIImage imageNamed:@"fave.png"] forState:UIControlStateNormal];
	[self.favoriteButton setImage:[UIImage imageNamed:@"fave.png"] forState:UIControlStateSelected];
	[self.favoriteButton setImage:[UIImage imageNamed:@"fave.png"] forState:UIControlStateHighlighted];
	self.title = @"Detail Promo";
	
	//Fetch data from CoreData
	NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Promo"];
	self.promos = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
	
	for (int i = 0; i<self.promos.count; i++) {
		NSManagedObject *array = [self.promos objectAtIndex:i];
		if ([[NSString stringWithFormat:@"%@",[array valueForKey:@"title"] ] isEqualToString:self.promo.title]) {
			[self.favoriteButton setImage:[UIImage imageNamed:@"fave_highlighted.png"] forState:UIControlStateNormal];
			[self.favoriteButton setImage:[UIImage imageNamed:@"fave_highlighted.png"] forState:UIControlStateSelected];
			[self.favoriteButton setImage:[UIImage imageNamed:@"fave_highlighted.png"] forState:UIControlStateHighlighted];
			
			_favorited = YES;
			_indexFavorited = i;
			break;
		}
	}
	
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self.navigationController setNavigationBarHidden:NO animated:YES];
	
}

-(void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	[self.tabBarController setTabBarHidden:NO animated:NO];
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

- (IBAction)favorites:(id)sender {
	NSManagedObjectContext *context = [self managedObjectContext];
	if (!_favorited) {
		NSManagedObject *promo = [NSEntityDescription insertNewObjectForEntityForName:@"Promo" inManagedObjectContext:context];
		[promo setValue:self.promo.title forKey:@"title"];
		[promo setValue:self.promo.brand forKey:@"brand"];
		[promo setValue:self.promo.brand_logo forKey:@"brand_logo"];
		[promo setValue:self.promo.desc	forKey:@"desc"];
		[promo setValue:self.promo.poster_big forKey:@"poster_big"];
		[promo setValue:self.promo.poster_small forKey:@"poster_small"];
		
		NSError *error = nil;
		if (![context save:&error]) {
			NSLog(@"Error saving to CoreData ! %@ %@",error,[error localizedDescription]);
		}
		
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Favorites"
													   message:[NSString stringWithFormat:@"You saved %@ as favorite",self.promo.title]
													  delegate:self
											 cancelButtonTitle:@"OK"
											 otherButtonTitles:nil, nil];
		[alert show];
		[self.favoriteButton setImage:[UIImage imageNamed:@"fave_highlighted.png"] forState:UIControlStateNormal];
		[self.favoriteButton setImage:[UIImage imageNamed:@"fave_highlighted.png"] forState:UIControlStateSelected];
		[self.favoriteButton setImage:[UIImage imageNamed:@"fave_highlighted.png"] forState:UIControlStateHighlighted];
		_favorited = YES;
	} else if (_favorited){
		[context deleteObject:[self.promos objectAtIndex:_indexFavorited]];
		NSError *error = nil;
		if (![context save:&error]) {
			NSLog(@"Error saving to CoreData ! %@ %@",error,[error localizedDescription]);
		}
		
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Favorites"
													   message:[NSString stringWithFormat:@"Promo %@ is removed from favorite list", self.promo.title]
													  delegate:self
											 cancelButtonTitle:@"OK"
											 otherButtonTitles:nil, nil];
		[alert show];
		[self.favoriteButton setImage:[UIImage imageNamed:@"fave.png"] forState:UIControlStateNormal];
		[self.favoriteButton setImage:[UIImage imageNamed:@"fave.png"] forState:UIControlStateSelected];
		[self.favoriteButton setImage:[UIImage imageNamed:@"fave.png"] forState:UIControlStateHighlighted];
		_favorited = NO;
	}
}

- (NSManagedObjectContext *)managedObjectContext {
	NSManagedObjectContext *context = nil;
	id delegate = [[UIApplication sharedApplication] delegate];
	if ([delegate performSelector:@selector(managedObjectContext)]) {
		context = [delegate managedObjectContext];
	}
	return context;
}
@end
