//
//  RecommendedContentViewController.h
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/16/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNCollectionCellBackgroundView.h"
#import "CHTCollectionViewWaterfallLayout.h"

@interface ContentViewController : UIViewController <UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionPromo;


- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
@property (nonatomic) NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;

@end
