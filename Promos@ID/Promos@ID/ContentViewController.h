//
//  RecommendedContentViewController.h
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/16/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSCollectionView.h"
#import "PNCollectionCellBackgroundView.h"
#import "PintCollectionViewLayout.h"

@interface ContentViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionPromo;



@property (nonatomic) NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;

@end
