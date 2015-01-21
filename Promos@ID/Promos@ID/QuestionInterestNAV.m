//
//  QuestionInterestNAV.m
//  Promos@ID
//
//  Created by reza hadafi on 1/21/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "QuestionInterestNAV.h"

@interface QuestionInterestNAV ()

@end

@implementation QuestionInterestNAV

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    UIImage *navBarBackgroundImage = [UIImage imageNamed:@"titlebackground.png"];
    [[UINavigationBar appearance] setBackgroundImage:navBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.translucent = YES;
    self.navigationBar.TintColor=[UIColor whiteColor];
    //self.navigationBar.barTintColor = [self colorWithHexString:@"FFFFFF"] ;
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
