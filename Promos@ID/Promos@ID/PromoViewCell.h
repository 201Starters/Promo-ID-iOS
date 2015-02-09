//
//  PromoViewCell.h
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/23/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PromoViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *poster;
@property (weak, nonatomic) IBOutlet UIImageView *brandLogo_small;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *brand;
@property (weak, nonatomic) IBOutlet UILabel *expiryNotification;

@end
