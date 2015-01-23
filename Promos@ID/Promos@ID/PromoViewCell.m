//
//  PromoViewCell.m
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/23/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "PromoViewCell.h"

#define MARGIN 8.0

@implementation PromoViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        promoThumbnail = [[UIImageView alloc] initWithFrame:CGRectZero];
        promoDesc = [[UILabel alloc] initWithFrame:CGRectZero];
        
        promoDesc.font = [UIFont boldSystemFontOfSize:14.0];
        promoDesc.numberOfLines = 0;
        promoDesc.backgroundColor = [UIColor clearColor];
        
        [self addSubview:promoThumbnail];
        [self addSubview:promoDesc];
        
        self.backgroundColor = [UIColor colorWithRed:236.0f/255.0f green:236.0f/255.0f blue:236.0f/255.0f alpha:1.0];
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 10.0f;
        self.layer.borderColor= [[UIColor colorWithRed:207.0f/255.0f green:207.0f/255.0f blue:207.0f/255.0f alpha:1] CGColor];
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    promoThumbnail.image = nil;
    promoDesc.text = nil;
}

- (void)layoutSubviews {
    // NSLog(@"object is %@", self.object);
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width - MARGIN * 2;
    CGFloat top = MARGIN;
    CGFloat left = MARGIN;
    
    // Image
    CGFloat objectWidth, objectHeight;
    if ([[self.object objectForKey:@"width"] floatValue] == 0) {
        objectWidth = 200.0f;
    } else {
        objectWidth = [[self.object objectForKey:@"width"] floatValue];
    }
    if ([[self.object objectForKey:@"height"] floatValue] == 0) {
        objectHeight = 200.0f;
    } else {
        objectHeight = [[self.object objectForKey:@"height"] floatValue];
    }
    CGFloat scaledHeight = floorf(objectHeight / (objectWidth / width));
    promoThumbnail.frame = CGRectMake(left, top, width, scaledHeight);
    
    // Label
    CGSize labelSize = CGSizeZero;
    labelSize = [promoDesc.text sizeWithFont:promoDesc.font constrainedToSize:CGSizeMake(width, INT_MAX) lineBreakMode:promoDesc.lineBreakMode];
    
    promoDesc.frame = CGRectMake(left, promoThumbnail.frame.origin.y + promoThumbnail.frame.size.height + MARGIN, labelSize.width, labelSize.height);
}

+ (CGFloat)heightForViewWithObject:(id)object inColumnWidth:(CGFloat)columnWidth {
    CGFloat height = 0.0;
    CGFloat width = columnWidth - MARGIN * 2;
    
    height += MARGIN;
    
    // Image
    CGFloat objectWidth = [[object objectForKey:@"width"] floatValue];
    CGFloat objectHeight = [[object objectForKey:@"height"] floatValue];
    CGFloat scaledHeight = floorf(objectHeight / (objectWidth / width));
    height += scaledHeight;
    
    // Label
    NSString *caption = [object objectForKey:@"title"];
    CGSize labelSize = CGSizeZero;
    UIFont *labelFont = [UIFont boldSystemFontOfSize:14.0];
    labelSize = [caption sizeWithFont:labelFont constrainedToSize:CGSizeMake(width, INT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    height += labelSize.height;
    
    height += MARGIN;
    
    return height;
}

- (void)collectionView:(PSCollectionView *)collectionView fillCellWithObject:(id)object atIndex:(NSInteger)index {
    [super collectionView:collectionView fillCellWithObject:object atIndex:index];
    
    promoThumbnail.image = [UIImage imageNamed:[[object objectAtIndex:index] objectForKey:@"poster_small"]];
    promoDesc.text = [[object objectAtIndex:index] objectForKey:@"title"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
