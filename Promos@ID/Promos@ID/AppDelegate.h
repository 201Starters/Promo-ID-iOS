//
//  AppDelegate.h
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/16/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString *location;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSString *location;

@end

