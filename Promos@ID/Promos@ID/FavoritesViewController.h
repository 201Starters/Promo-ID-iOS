//
//  FavoritesViewController.h
//  Promos@ID
//
//  Created by Farandi Kusumo on 2/1/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Promo.h"
#import "PNCollectionCellBackgroundView.h"
#import "PromoViewCell.h"

@interface FavoritesViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionPromo;

@end
