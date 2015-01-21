//
//  QuestionInterest.m
//  Promos@ID
//
//  Created by reza hadafi on 1/20/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import "QuestionInterest.h"
#import "UIImage+ImageEffects.h"

@interface QuestionInterest ()
@property (nonatomic) UIImage *image;

@end

@implementation QuestionInterest

- (void)viewDidLoad {
    [super viewDidLoad];
    arrayinterest = [[NSMutableArray alloc] init];
    UIImage *image = [UIImage imageNamed:@"title.png"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    
    
    UIButton* nextButton = [UIButton buttonWithType:101]; // left-pointing shape!
    [nextButton addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    [nextButton setTitle:@"Next" forState:UIControlStateNormal];
    // create button item -- possible because UIButton subclasses UIView!
    UIBarButtonItem* nextItem = [[UIBarButtonItem alloc] initWithCustomView:nextButton];
    self.navigationItem.RightBarButtonItem = nextItem;
    
    
    UIImageView * ViewBackgroundImage=[[UIImageView alloc] initWithFrame:self.view.frame];
    self.image = [UIImage imageNamed:@"background1.png"];
    UIImage *effectImage = nil;
    effectImage = [self.image applyDarkEffect];
    ViewBackgroundImage.image = effectImage;
    //self.view.backgroundColor=[UIColor colorWithPatternImage:self.image];
    [self.view insertSubview:ViewBackgroundImage atIndex:0];
    //[self.view sendSubviewToBack:ViewBackgroundImage];
    _array = [[NSMutableArray alloc] initWithObjects:@"Foo",
              @"Tag Label",
              @"Tag Label",
              @"Tag",
              @"Tag Label",
              @"Long long long long long long Tag", nil];
    [_tagList setAutomaticResize:YES];
    [_tagList setTags:_array];
    [_tagList setTagDelegate:self];
    [_tagList setCornerRadius:4.0f];
    [_tagList setTextColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
}

-(IBAction)nextAction{
    
    NSLog(@"isi array= %d",arrayinterest.count);
    //[arrayinterest addObject:@"string1"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectedTag:(NSString *)tagName tagIndex:(NSInteger)tagIndex
{
    if (![arrayinterest containsObject:tagName]) {
        [arrayinterest addObject:tagName];
    }else {
        [arrayinterest removeObject:tagName];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                    message:[NSString stringWithFormat:@"You tapped tag %@ at index %ld", tagName,(long)tagIndex]
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
    //UIColor*colorcheck=[_tagList viewWithTag:tagIndex].backgroundColor;
    
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
