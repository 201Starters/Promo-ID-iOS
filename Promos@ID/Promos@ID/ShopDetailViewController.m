//
//  ShopDetailViewController.m
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/22/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "ShopDetailViewController.h"

@interface ShopDetailViewController ()

@end

@implementation ShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.shop.name;
    self.thumbnailShop.image = [UIImage imageNamed:self.shop.image];
    self.locationMallLabel.text = [NSString stringWithFormat:@"at %@",[self.shop.location objectAtIndex:0]];
    self.webLabel.text = self.shop.web;
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

- (IBAction)segmentedValueChanged:(UISegmentedControl *)sender {
}
@end
