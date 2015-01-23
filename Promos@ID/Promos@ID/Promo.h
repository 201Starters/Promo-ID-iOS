//
//  Promo.h
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/22/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Promo : NSObject
@property (nonatomic, strong) NSString *title; // title of promo
@property (nonatomic, strong) NSString *brand; // brand who do the promo
@property (nonatomic, strong) NSArray *shop; // shop of promo
@property (nonatomic, strong) NSArray *location; // location of promo
@property (nonatomic, strong) NSString *poster_small; // thumbnail file of promo
@property (nonatomic, strong) NSString *poster_big; // poster file of promo
@property (nonatomic, strong) NSString *desc; // map image of venue

@end
