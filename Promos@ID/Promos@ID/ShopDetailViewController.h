//
//  ShopDetailViewController.h
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/22/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shop.h"

@interface ShopDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailShop;
@property (weak, nonatomic) IBOutlet UILabel *locationMallLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationBlockLabel;
@property (weak, nonatomic) IBOutlet UILabel *opHoursLabel;
@property (weak, nonatomic) IBOutlet UILabel *webLabel;


- (IBAction)segmentedValueChanged:(UISegmentedControl *)sender;
@property (strong,nonatomic) Shop *shop;
@end
