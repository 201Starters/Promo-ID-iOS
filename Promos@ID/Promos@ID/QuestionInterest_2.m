//
//  QuestionInterest_2.m
//  Promos@ID
//
//  Created by reza hadafi on 1/21/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "QuestionInterest_2.h"


@interface QuestionInterest_2 ()
@property (nonatomic) UIImage *imagebackground;

@end

@implementation QuestionInterest_2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.view insertSubview:ViewBackgroundImage atIndex:0];
    self.view.backgroundColor=[UIColor blackColor];
    pageImages = @[@"background1.png", @"background2.png"];
    pagelabel = @[@"Choose your Interest", @"Choose your Favourite Brand"];
    ListInterest =@[@"Breathing",@"Eating",@"Sport",@"Technology",@"Sex",@"Shopping",@"Knowledge"];
    ListFavouriteBrand =@[@"Apple",@"Sony",@"Razer",@"Beats",@"Huawei",@"Milkita",@"Aqua",@"Yagitudeh"];
    pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    pageViewController.dataSource = self;
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+40);
    [self addChildViewController:pageViewController];
    [self.view insertSubview:pageViewController.view atIndex:0];
    [pageViewController didMoveToParentViewController:self];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
   PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self->pageImages[index];
    pageContentViewController.Labeltext=self->pagelabel[index];
    if(index==0){
        pageContentViewController.arraytag=self->ListInterest;
    }else pageContentViewController.arraytag=self->ListFavouriteBrand;
    pageContentViewController.pageIndex = index;
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self->pageImages count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self->pageImages count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
