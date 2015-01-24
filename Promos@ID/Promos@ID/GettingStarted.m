//
//  GettingStarted.m
//  Promos@ID
//
//  Created by reza hadafi on 1/25/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "GettingStarted.h"

@interface GettingStarted ()

@end

@implementation GettingStarted

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView * ViewBackgroundImage=[[UIImageView alloc] initWithFrame:self.view.frame];
    UIImage* imagebackground = [UIImage imageNamed:@"background2.png"];
    UIImage * effectImage = nil;
    effectImage = [imagebackground applyDarkEffect];
    ViewBackgroundImage.image = effectImage;
    [self.view insertSubview:ViewBackgroundImage atIndex:0];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
