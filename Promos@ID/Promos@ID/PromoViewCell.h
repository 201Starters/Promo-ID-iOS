//
//  PromoViewCell.h
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/23/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "PSCollectionViewCell.h"

@interface PromoViewCell : PSCollectionViewCell{
    UIImageView *promoThumbnail;
    UILabel *promoDesc;
}

+ (CGFloat)heightForViewWithObject:(id)object inColumnWidth:(CGFloat)columnWidth;


@end
