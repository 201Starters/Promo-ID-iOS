//
//  PageContentViewController.h
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWTagList.h"

@interface PageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *labelchoose;
@property NSString *imageFile;
@property NSString *Labeltext;
@property NSUInteger pageIndex;
@property NSMutableArray *arrayinterest;
@property (nonatomic, strong) NSArray        *arraytag;
@property (nonatomic, strong) IBOutlet DWTagList    *tagList;
@end
