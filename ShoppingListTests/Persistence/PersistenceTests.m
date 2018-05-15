//
//  PersistenceTests.m
//  ShoppingList
//
//  Created by Rich Halliday on 2018-05-13.
//  Copyright © 2018 SFNSFN. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Item.h"
#import "ItemListPersistence.h"
#import "ListItem.h"

@interface PersistenceTests : XCTestCase

@end

@implementation PersistenceTests

NSString *fileName = @"item.txt";

- (void)tearDown
{
    [super tearDown];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    NSError *error;

    if ([fileManager fileExistsAtPath:filePath] && ![fileManager removeItemAtPath:filePath error:&error])
    {
        NSLog(@"Could not delete file -:%@ ",[error localizedDescription]);
    }
    
    XCTAssertFalse([fileManager fileExistsAtPath:filePath]);
}

- (void)testAnItemCanBeSavedAndRestoredInMemory
{
    Item *item = [[Item alloc] init:@"Item"];
    
    NSData *itemData = [NSKeyedArchiver archivedDataWithRootObject:item];    
    Item *restoredItem = [NSKeyedUnarchiver unarchiveObjectWithData:itemData];
    
    XCTAssertEqualObjects(restoredItem, item);
}

- (void)testAnItemCanBeSavedAndRestoredOnDisk
{
    Item *item = [[Item alloc] init:@"Item"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *itemFilePath = [documentsDirectory stringByAppendingPathComponent:fileName];

    [NSKeyedArchiver archiveRootObject:item toFile:itemFilePath];
    Item *restoredItem = [NSKeyedUnarchiver unarchiveObjectWithFile:itemFilePath];
    
    XCTAssertEqualObjects(restoredItem, item);
}

- (void)testAnItemListCanBePersisted
{
    Item *item = [[Item alloc] init:@"Item"];
    Item *item2 = [[Item alloc] init:@"Item 2"];
    Item *item3 = [[Item alloc] init:@"Item 3"];
    NSMutableArray *itemList = [[NSMutableArray alloc] init];
    
    [itemList addObject:item];
    [itemList addObject:item2];
    [itemList addObject:item3];
    
    [ItemListPersistence saveItemList:itemList toFile:fileName];
    NSArray *restoredList = [ItemListPersistence loadItemListFromFile:fileName];
    
    XCTAssertEqualObjects(restoredList, itemList);
}

- (void)testItemListPersistenceLoadReturnsAnEmptyArrayIfNoFileExists
{
    NSArray *restoredList = [ItemListPersistence loadItemListFromFile:fileName];
    
    XCTAssertEqual([restoredList count], 0);
}

- (void)testAListOfListItemsCanBeSavedAndRestoredInMemory
{
    ListItem *listItem = [[ListItem alloc] initWithName:@"List Item" andAmount:@"Amount"];
    
    NSData *listItemData = [NSKeyedArchiver archivedDataWithRootObject:listItem];
    Item *restoredListItem = [NSKeyedUnarchiver unarchiveObjectWithData:listItemData];
    
    XCTAssertEqualObjects(restoredListItem, listItem);
}

@end
