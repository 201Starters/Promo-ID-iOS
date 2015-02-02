//
//  PromoDetailViewController.h
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/28/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Promo.h"

@interface PromoDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *poster_big;
@property (weak, nonatomic) IBOutlet UIImageView *brandLogo;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UITableView *stores;
- (IBAction)favorites:(id)sender;


@property (strong,nonatomic) Promo *promo;

@end
