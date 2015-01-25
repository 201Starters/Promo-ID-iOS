//
//  RecommendedContentViewController.m
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/16/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "ContentViewController.h"
#import "Promo.h"
#import "PromoViewCell.h"

@interface ContentViewController ()

@end

@implementation ContentViewController{
    NSArray *promos;
}
@synthesize pageIndex;
//@synthesize promoView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLabel.text = self.titleText;
    [self initiateVariable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [promos count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PromoViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PromoCell" forIndexPath:indexPath];
    Promo *promo = nil;
    NSLog(@"masuk");
    promo = [promos objectAtIndex:indexPath.row];
    
    cell.poster.image = [UIImage imageNamed:promo.poster_small];
    cell.title.text = promo.title;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Promo *promo = nil;
    promo = [promos objectAtIndex:indexPath.row];
    UIImage *image;
    image = [UIImage imageNamed:promo.poster_small];
    CGSize size = CGSizeMake(150.00, image.size.height);
    return size;
}

#pragma mark - initiate dummy variable

-(void)initiateVariable
{
    Promo *etude_EOYSale    = [Promo new];
    etude_EOYSale.title     = @"Etude End of Year Sale";
    etude_EOYSale.brand     = @"";
    etude_EOYSale.shop      = [NSArray arrayWithObjects:@"", nil];
    etude_EOYSale.location  = [NSArray arrayWithObjects:@"", nil];
    etude_EOYSale.poster_small= @"etudeEOYSale.png";
    etude_EOYSale.poster_big  = @"";
    etude_EOYSale.desc      = @"";
    
    Promo *mandiri_discount = [Promo new];
    mandiri_discount.title = @"Mandiri Discount";
    mandiri_discount.brand     = @"";
    mandiri_discount.shop      = [NSArray arrayWithObjects:@"", nil];
    mandiri_discount.location  = [NSArray arrayWithObjects:@"", nil];
    mandiri_discount.poster_small= @"mandiriDiscount.png";
    mandiri_discount.poster_big  = @"";
    mandiri_discount.desc      = @"";

    
    Promo *cinema21_promo = [Promo new];
    cinema21_promo.title = @"Cinema 21 Promo";
    cinema21_promo.brand     = @"";
    cinema21_promo.shop      = [NSArray arrayWithObjects:@"", nil];
    cinema21_promo.location  = [NSArray arrayWithObjects:@"", nil];
    cinema21_promo.poster_small= @"promo2.png";
    cinema21_promo.poster_big  = @"";
    cinema21_promo.desc      = @"";
    
    promos = [NSArray arrayWithObjects:cinema21_promo,mandiri_discount,cinema21_promo, nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
