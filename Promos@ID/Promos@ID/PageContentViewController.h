//
//  PageContentViewController.h
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWTagList.h"
#import <CoreData/CoreData.h>
#import "PageContentViewController.h"

@interface PageContentViewController : UIViewController <UISearchBarDelegate>
{
    NSMutableArray* arraysearch;
    NSString* mode;
}

@property (strong) NSMutableArray *arrayinterest;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *labelchoose;
@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;
@property NSString *imageFile;
@property NSString *Labeltext;
@property NSUInteger pageIndex;
@property (nonatomic, strong) NSArray        *arraytag;
@property (nonatomic, strong) IBOutlet DWTagList    *tagList;

//-(void)changetagbackground;
@end
