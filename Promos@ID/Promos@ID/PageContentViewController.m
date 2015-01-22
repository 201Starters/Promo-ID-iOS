//
//  PageContentViewController.m
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "PageContentViewController.h"
#import "UIImage+ImageEffects.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImageView * ViewBackgroundImage=[[UIImageView alloc] initWithFrame:self.view.frame];
    UIImage* imagebackground = [UIImage imageNamed:self.imageFile];
    UIImage * effectImage = nil;
    effectImage = [imagebackground applyDarkEffect];
    self.backgroundImageView.image = effectImage;
    self.labelchoose.text=self.Labeltext;
    self.view.backgroundColor=[UIColor blackColor];
    
    /*_arraytag = [[NSMutableArray alloc] initWithObjects:@"Foo",
                 @"Tag Label",
                 @"Tag Label",
                 @"Tag",
                 @"Tag Label",
                 @"Long long long long long long Tag",
                 @"Tag Label",
                 @"Tag Label",
                 @"Tag",
                 @"Tag Label",
                 @"Tag Label",
                 @"Tag Label",
                 @"Tag",
                 @"Tag Label",
                 @"Tag Label",
                 @"Tag Label",
                 @"Tag",
                 @"Tag Label",
                 @"Tag Label",
                 @"Tag Label",
                 @"Tag",
                 @"Tag Label",
                 @"Tag Label",
                 @"Tag Label",
                 @"Tag",
                 @"Tag Label",
                 @"Tag Label",
                 @"Tag Label",
                 @"Tag",
                 @"Tag Label",
                 @"Tag Label",
                 @"Tag Label",
                 @"Tag",
                 @"Tag Label",@"Tag Label",
                 @"Tag Label",
                 @"Tag",
                 @"Tag Label",@"Tag Label",
                 @"Tag Label",
                 @"Tag",
                 @"Tag Label",
                 nil];*/
    [self.tagList setAutomaticResize:YES];
    [self.tagList setTags:_arraytag];
    [self.tagList setTagDelegate:self];
    [self.tagList setCornerRadius:4.0f];
    [self.tagList setTextColor:[UIColor whiteColor]];
   // self.titleLabel.text = self.titleText;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
