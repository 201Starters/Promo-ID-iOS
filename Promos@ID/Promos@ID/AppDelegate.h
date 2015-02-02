//
//  AppDelegate.h
//  Promos@ID
//
//  Created by Farandi Kusumo on 1/16/15.
//  Copyright (c) 2015 Farandi Kusumo. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
#import <CoreData/CoreData.h>
=======
@import CoreData;
>>>>>>> 58642eb9846fbb2e08dc114081c4c65d5e2f2c9d

@interface AppDelegate : UIResponder <UIApplicationDelegate>

//@property (strong, nonatomic) CoreDataSaveArrayViewController *viewController;
{
    NSMutableString *location;
	NSManagedObjectModel *managedObjectModel;
	NSManagedObjectContext *managedObjectContext;
	NSPersistentStoreCoordinator *persistentStoreCoordinator;
}
@property (strong, nonatomic) UIWindow *window;
<<<<<<< HEAD
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@property (nonatomic, retain) NSString *location;
=======
@property (nonatomic, retain) NSMutableString *location;

@property (nonatomic, strong, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory;
>>>>>>> 58642eb9846fbb2e08dc114081c4c65d5e2f2c9d

@end

