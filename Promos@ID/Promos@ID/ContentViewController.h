//
//  RecommendedContentViewController.h
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/16/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSCollectionView.h"

@interface ContentViewController : UIViewController //<UIScrollViewDelegate,PSCollectionViewDataSource,PSCollectionViewDelegate>
{
    //PSCollectionView *promoView;
}

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pageImages;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
//@property (retain, nonatomic) PSCollectionView *promoView;


@property (nonatomic) NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;

@end
