//
//  Venue.h
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/21/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Venue : NSObject
@property (nonatomic, strong) NSString *name; // name of venue
@property (nonatomic, strong) NSString *location; // location of venue
@property (nonatomic, strong) NSString *image; // image filename of venue
@property (nonatomic, strong) NSString *map; // map image of venue
@property (nonatomic, strong) NSArray *store; //store in the venue
@end
