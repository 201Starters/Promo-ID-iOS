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

    if (self.pageIndex==0) {
        mode=@"Interest";
    }else{
        mode=@"Brand";
    }
    self.arrayinterest=[[NSMutableArray alloc] init];
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:mode];
    self.arrayinterest = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    UIImageView * ViewBackgroundImage=[[UIImageView alloc] initWithFrame:self.view.frame];
    UIImage* imagebackground = [UIImage imageNamed:self.imageFile];
    UIImage * effectImage = nil;
    effectImage = [imagebackground applyDarkEffect];
    self.backgroundImageView.image = effectImage;
    self.labelchoose.text=self.Labeltext;
    self.view.backgroundColor=[UIColor blackColor];
    
    [self.tagList setAutomaticResize:YES];
    [self.tagList setTags:_arraytag:self.arrayinterest];
    [self.tagList setTagDelegate:self];
    [self.tagList setCornerRadius:4.0f];
    [self.tagList setTextColor:[UIColor whiteColor]];
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:[UIColor whiteColor]];
    [self.searchbar setDelegate:self];
    
    
}


- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)selectedTag:(NSString *)tagName tagIndex:(NSInteger)tagIndex
{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:mode];
    self.arrayinterest = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    BOOL exist=NO;
    for (int i=0; i<self.arrayinterest.count; i++) {
        NSManagedObject *array = [self.arrayinterest objectAtIndex:i];
        if ([[NSString stringWithFormat:@"%@",[array valueForKey:@"name"] ] isEqualToString:tagName]) {
            exist=YES;
            break;
        }
    }
    if(exist){
        int tagint=nil;
        for (int i=0; i<self.arrayinterest.count; i++) {
            NSManagedObject *array = [self.arrayinterest objectAtIndex:i];
            if([[NSString stringWithFormat:@"%@",[array valueForKey:@"name"] ]isEqualToString:tagName]){
                tagint=i;
                break;
            }
        }
        [context deleteObject:[self.arrayinterest objectAtIndex:tagint]];
        NSError *error;
        if (![context save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:mode];
        self.arrayinterest = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
       
    }else {
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:mode inManagedObjectContext:context];
        [newDevice setValue:tagName forKey:@"name"];
        NSError *error = nil;
        // Save the object to persistent store
        if (![context save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:mode];
        self.arrayinterest = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    }
    
    /*if ([self.arrayinterest containsObject:tagName]) {
        //[self.arrayinterest addObject:tagName];
        
    }else {
        
    }*/
    
    
}

- (void) searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
    // TODO - dynamically update the search results here, if we choose to do that.
    /*NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Interest"];
    self.arrayinterest = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];*/
    if (![theSearchBar isFirstResponder]) {
        // The user clicked the [X] button while the keyboard was hidden
        [self.tagList setTags:self.arraytag:self.arrayinterest];
        [self.tagList reloadInputViews];
        [theSearchBar performSelector: @selector(resignFirstResponder)
                           withObject: nil
                           afterDelay: 0.0];
    }
    else if ([searchText length] == 0) {
        // The user clicked the [X] button or otherwise cleared the text.
        [theSearchBar performSelector: @selector(resignFirstResponder)
                           withObject: nil
                           afterDelay: 0.0];
        [self.tagList setTags:self.arraytag:self.arrayinterest];
        [self.tagList reloadInputViews];
      //  NSLog(@"isi array =%d",self.arrayinterest.count);
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    /*NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Interest"];
    self.arrayinterest = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];*/
    [searchBar resignFirstResponder];
    arraysearch = [[NSMutableArray alloc] init];
    for (int i=0; i<self.arraytag.count; i++) {
        
       // NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF IN %@", self.arraytag];
        //BOOL result = [predicate evaluateWithObject:self.searchbar.text];
        
        if ([[self.arraytag objectAtIndex:i] containsString: self.searchbar.text]) {
            [arraysearch addObject:[self.arraytag objectAtIndex:i]];
            //NSLog(@"isi search= %@",[self.arraytag objectAtIndex:i]);
        }
    }
    [self.tagList setTags:arraysearch:self.arrayinterest];
    [self.tagList reloadInputViews];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
