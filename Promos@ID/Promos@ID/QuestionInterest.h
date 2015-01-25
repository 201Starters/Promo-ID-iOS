//
//  QuestionInterest.h
//  Promos@ID
//
//  Created by reza hadafi on 1/20/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWTagList.h"

@interface QuestionInterest : UIViewController
{
    NSMutableArray *arrayinterest;
}

@property (nonatomic, strong) NSMutableArray        *arraytag;
@property (nonatomic, strong) IBOutlet DWTagList    *tagList;


@end
