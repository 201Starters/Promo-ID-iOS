//
//  RecommendedContentViewController.h
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/16/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PintCollectionViewLayout.h"
#import "PNCollectionCellBackgroundView.h"

@interface ContentViewController : UIViewController<UICollectionViewDelegateJSPintLayout,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pageImages;

@property (nonatomic) NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;
@end
