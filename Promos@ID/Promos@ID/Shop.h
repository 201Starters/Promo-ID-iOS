//
//  Shop.h
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/21/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject
@property (nonatomic, strong) NSString *name; // name of shop
@property (nonatomic, strong) NSArray *location; // location of shop
@property (nonatomic, strong) NSString *image; // image filename of shop
@property (nonatomic, strong) NSString *web;
@property (nonatomic, strong) NSString *phoneNumber; // phone number of shop
@end
