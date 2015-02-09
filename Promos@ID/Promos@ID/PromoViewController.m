//
//  FirstViewController.m
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/16/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "PromoViewController.h"
#import "AppDelegate.h"
@import CoreLocation;

@interface PromoViewController ()

@end

@implementation PromoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Set Location in Title - observing notification
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updatedLocation:)
                                                 name:@"newLocationNotif"
                                               object:nil];
	
	 [[NSNotificationCenter defaultCenter]addObserver:self
											selector:@selector(expandContractState:)
												name:@"expandState" object:nil];
	[[NSNotificationCenter defaultCenter]addObserver:self
											selector:@selector(expandContractState:)
												name:@"contractState" object:nil];
	
    // Initiate PageView
    
    self.pageTitles = @[@"Recommended Promo",@"Featured Promo",@"Ending Promo"];
    
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    ContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers
									  direction:UIPageViewControllerNavigationDirectionForward
									   animated:NO
									 completion:nil];
	
    self.pageViewController.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 40);
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
	
	
	//UIPageControl settings
	UIColor *indicatorTintColor = [UIColor colorWithRed:255/255.0 green:205/255.0 blue:119/255.0 alpha:1.0];
	self.pageControl.pageIndicatorTintColor = indicatorTintColor;
	self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
	self.pageControl.backgroundColor = [UIColor clearColor];
	[self.view bringSubviewToFront:self.pageControl];
	
	//UINavigationController settings
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
	
	//UITabBarController settings
    self.tabBarController.tabBar.barTintColor = [UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:0.2];
    self.tabBarController.tabBar.tintColor = [UIColor orangeColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startWalkthrough:(id)sender {
}



#pragma mark - Page View Controller Data Source



-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ContentViewController *)viewController).pageIndex;
	
	[self.pageControl setCurrentPage:index];
	
    if ((index == 0)||(index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ContentViewController*)viewController).pageIndex;
	[self.pageControl setCurrentPage:index];
	if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == self.pageTitles.count) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}


- (ContentViewController *)viewControllerAtIndex:(NSUInteger) index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    ContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"collectionView"];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

-(NSInteger) presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return [self.pageTitles count];
}

-(NSInteger) presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

#pragma mark - get location from appdelegate

-(void)updatedLocation:(NSNotification*)notif
{
    CLLocation *userLocation = (CLLocation*)[[notif userInfo] valueForKey:@"newLocationResult"];
    self.userLocationString = [NSMutableString stringWithFormat:@"%.3f,%.3f",userLocation.coordinate.latitude,userLocation.coordinate.longitude];
    [self.locationLabel setText:[NSMutableString stringWithFormat:@"You're near %.6f,%.6f",userLocation.coordinate.latitude,userLocation.coordinate.longitude]];
}

#pragma mark - expand & contract view

-(void)expandContractState:(NSNotification*)notif
{
	if ([[notif name]isEqualToString:@"expandState"]) {
		[UIView animateWithDuration:0.2
						 animations:^{
						 self.pageViewController.view.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height);
						 }
						 completion:^(BOOL finished){
						 self.pageViewController.view.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height);
						 }];
		
		//NSLog(@"expand");
	} else if ([[notif name]isEqualToString:@"contractState"]){
		[UIView animateWithDuration:0.2
						 animations:^{
						 		self.pageViewController.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 40);
						 }
						 completion:^(BOOL finished){
						 		self.pageViewController.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 40);
						 }];

		//NSLog(@"contract");
	}
}
@end
