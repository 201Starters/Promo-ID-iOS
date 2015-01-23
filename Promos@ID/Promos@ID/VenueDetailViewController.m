//
//  VenueDetailViewController.m
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/21/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "VenueDetailViewController.h"

@interface VenueDetailViewController ()

@end

@implementation VenueDetailViewController
@synthesize viewStore;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.venue.name;
    self.addressLabel.textColor = [UIColor whiteColor];
    self.addressLabel.text = self.venue.location;
    self.imageMall.image = [UIImage imageNamed:self.venue.image];
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
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.viewStore.hidden = YES;
            break;
        case 1:
            self.viewStore.hidden = NO;
            break;
        case 2:
            self.viewStore.hidden = YES;
            break;
        default:
            break;
    }
}

@end
