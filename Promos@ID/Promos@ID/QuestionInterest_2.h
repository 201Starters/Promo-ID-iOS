//
//  QuestionInterest_2.h
//  Promos@ID
//
//  Created by reza hadafi on 1/21/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface QuestionInterest_2 : UIViewController <UIPageViewControllerDataSource>
{
    UIPageViewController *pageViewController;
    NSArray *pageImages;
    NSArray *pagelabel;
    NSArray *ListInterest;
    NSArray *ListFavouriteBrand;
}

@end
