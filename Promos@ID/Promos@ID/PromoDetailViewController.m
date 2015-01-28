//
//  PromoDetailViewController.m
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/28/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "PromoDetailViewController.h"

@interface PromoDetailViewController ()

@end

@implementation PromoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	UIImage *poster = nil;
	poster = [UIImage imageNamed:self.promo.poster_small];
	
	
	//self.poster_big.contentMode = UIViewContentModeScaleAspectFit;
	//self.poster_big.clipsToBounds = YES;

	double scale = self.view.frame.size.width / poster.size.width;
	self.poster_big.image = poster;
	
	self.poster_big.frame = CGRectMake(self.poster_big.frame.origin.x, self.poster_big.frame.origin.y, (poster.size.width*scale), (poster.size.height*scale));
	NSLog(@"scale : %f \n width poster : %f \n height poster: %f \n width imageView: %f \n height imageView :%f",scale,poster.size.width,poster.size.height,self.poster_big.frame.size.width,self.poster_big.frame.size.height);
	
	
	self.brandLogo.image = [UIImage imageNamed:self.promo.brand_logo];
	self.titleLabel.numberOfLines = 10;
	self.titleLabel.frame = CGRectMake(self.titleLabel.frame.origin.x
									   , self.titleLabel.frame.origin.y
									   , self.poster_big.frame.size.width
									   , 80);
	self.titleLabel.text = self.promo.title;
	self.descriptionLabel.text = self.promo.desc;
	
	self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
	
	self.title = @"Detail Promo";
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

- (IBAction)favorites:(id)sender {
}
@end
