//
//  VenueDetailViewController.h
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/21/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Venue.h"
#import "PNCollectionCellBackgroundView.h"
#import "PromoViewCell.h"


@interface VenueDetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageMall;

- (IBAction)segmentedValueChanged:(UISegmentedControl *)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableContent;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionPromo;


@property (strong,nonatomic) Venue *venue;
@end
