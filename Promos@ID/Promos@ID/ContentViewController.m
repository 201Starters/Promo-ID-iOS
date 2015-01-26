//
//  RecommendedContentViewController.m
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/16/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()
@property (strong,nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong,nonatomic) NSMutableArray* photoList;
@end

#define kCollectionCellBorderTop 17.0
#define kCollectionCellBorderBottom 17.0
#define kCollectionCellBorderLeft 17.0
#define kCollectionCellBorderRight 17.0

@implementation ContentViewController

@synthesize pageIndex;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLabel.text = self.titleText;
    // set up delegates
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    // set inter-item spacing in the layout
    PintCollectionViewLayout* customLayout = (PintCollectionViewLayout*)self.collectionView.collectionViewLayout;
    customLayout.interitemSpacing = 14.0;
    
    // make up some test data
    self.photoList = [NSMutableArray arrayWithCapacity:1];
    [self.photoList addObject:@"danielle.jpg"];
    [self.photoList addObject:@"bodegahead.png"];
    [self.photoList addObject:@"egret.png"];
    [self.photoList addObject:@"betceemay.jpg"];
    [self.photoList addObject:@"baby.jpg"];
    [self.photoList addObject:@"danielle.jpg"];
    [self.photoList addObject:@"bodegahead.png"];
    [self.photoList addObject:@"egret.png"];
    [self.photoList addObject:@"betceemay.jpg"];
    [self.photoList addObject:@"baby.jpg"];
    [self.photoList addObject:@"danielle.jpg"];
    [self.photoList addObject:@"bodegahead.png"];
    [self.photoList addObject:@"egret.png"];
    [self.photoList addObject:@"betceemay.jpg"];
    [self.photoList addObject:@"baby.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UICollectionViewDelegateJSPintLayout




- (CGFloat)columnWidthForCollectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout
{
    return (self.view.frame.size.width-45)/2;
}

- (NSUInteger)maximumNumberOfColumnsForCollectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout
{
    NSUInteger numColumns = 2;
    
    return numColumns;
}

- (CGFloat)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath*)indexPath
{
    NSUInteger index = [indexPath indexAtPosition:1];
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.photoList[index]]];
    CGSize rctSizeOriginal = imageView.bounds.size;
    double scale = ((self.view.frame.size.width-45)/2) / rctSizeOriginal.width;
    CGSize rctSizeFinal = CGSizeMake(rctSizeOriginal.width * scale,rctSizeOriginal.height * scale);
    imageView.frame = CGRectMake(kCollectionCellBorderLeft,kCollectionCellBorderTop,rctSizeFinal.width,rctSizeFinal.height);
    
    CGFloat height = imageView.bounds.size.height + 80;
    
    return height;
}

- (BOOL)collectionView:(UICollectionView*)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath*)indexPath
{
    return YES;
}

- (BOOL)collectionView:(UICollectionView*)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath*)indexPath withSender:(id)sender
{
    return([NSStringFromSelector(action) isEqualToString:@"cut:"]);
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath*)indexPath withSender:(id)sender
{
    if([NSStringFromSelector(action) isEqualToString:@"cut:"])
    {
        NSUInteger index = [indexPath indexAtPosition:1];
        
        [self.photoList removeObjectAtIndex:index];
        
        [self.collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
    }
}



#pragma mark = UICollectionViewDataSource



- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.photoList count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return 1;
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PintReuse" forIndexPath:indexPath];
    
    CGRect rectReference = cell.bounds;
    
    PNCollectionCellBackgroundView* backgroundView = [[PNCollectionCellBackgroundView alloc] initWithFrame:rectReference];
    cell.backgroundView = backgroundView;
    
    UIView* selectedBackgroundView = [[UIView alloc] initWithFrame:rectReference];
    selectedBackgroundView.backgroundColor = [UIColor clearColor];   // no indication of selection
    cell.selectedBackgroundView = selectedBackgroundView;
    
    // remove subviews from previous usage of this cell
    [[cell.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSUInteger index = [indexPath indexAtPosition:1];
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.photoList[index]]];
    CGSize rctSizeOriginal = imageView.bounds.size;
    double scale = (cell.bounds.size.width) / rctSizeOriginal.width;
    CGSize rctSizeFinal = CGSizeMake(rctSizeOriginal.width * scale,rctSizeOriginal.height * scale);
    imageView.frame = CGRectMake(0,0,rctSizeFinal.width,rctSizeFinal.height);
    
    [cell.contentView addSubview:imageView];
    
    UIImageView* thumbnailstore = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.photoList[index]]];
    double scalethumb = 20 / thumbnailstore.bounds.size.width;
    CGSize rctSizeFinalthumb = CGSizeMake(rctSizeOriginal.width * scalethumb,rctSizeOriginal.height * scalethumb);
    thumbnailstore.frame = CGRectMake(5,rctSizeFinal.height+10,20,20);
    
    [cell.contentView addSubview:thumbnailstore];
    
    CGRect rctLabeltitle = CGRectMake(30,rctSizeFinal.height+10,(cell.bounds.size.width)-40,20);
    UILabel* labeltitle = [[UILabel alloc] initWithFrame:rctLabeltitle];
    labeltitle.numberOfLines = 1;
    labeltitle.font = [UIFont systemFontOfSize:10];
    labeltitle.text = @"This is title";
    [cell.contentView addSubview:labeltitle];
    
    CGRect rctLabeldesc = CGRectMake(5,rctSizeFinal.height+35,(cell.bounds.size.width)-5,40);
    UILabel* labeldesc = [[UILabel alloc] initWithFrame:rctLabeldesc];
    labeldesc.numberOfLines = 3;
    labeldesc.font = [UIFont systemFontOfSize:10];
    labeldesc.text = @"This is description of the promo, just 3 line and cant be expanded";
    [cell.contentView addSubview:labeldesc];
    
    
    return cell;
    
}

@end
