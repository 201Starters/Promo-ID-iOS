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

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        
        //[_poster setFrame:CGRectMake(0, 0, self.frame.size.width, 100)];
        UIView *bgView = [[UIView alloc] initWithFrame:self.backgroundView.frame];
        bgView.backgroundColor = [UIColor blueColor];
        bgView.layer.borderColor = [[UIColor whiteColor] CGColor];
        bgView.layer.borderWidth = 4;
        self.selectedBackgroundView = bgView;
    }
    return self;
}




@end
