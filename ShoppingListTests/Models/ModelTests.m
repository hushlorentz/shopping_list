#import <XCTest/XCTest.h>
#import "Item.h"
#import "ListItem.h"
#import "Recipe.h"

@interface ModelTests : XCTestCase

@end

@implementation ModelTests

- (void)testAnItemHasAName
{
    NSString *itemName = @"Item 1";
    Item *item = [[Item alloc] init:itemName];
    
    XCTAssertEqualObjects(item.name, itemName);
}

- (void)testTwoItemsAreEqualIfTheirNamesAreCaseInsensitivelyEqual
{
    Item *item1 = [[Item alloc] init:@"Item"];
    Item *item2 = [[Item alloc] init:@"item"];
    Item *item3 = [[Item alloc] init:@"Item Not Equal"];
    
    XCTAssertEqualObjects(item1, item2);
    XCTAssertEqualObjects(item2, item1);
    XCTAssertNotEqualObjects(item1, item3);
    XCTAssertNotEqualObjects(item2, item3);
}

- (void)testARecipeHasAName
{
    NSString *recipeName = @"Recipe 1";
    Recipe *recipe = [[Recipe alloc] init:recipeName];
    
    XCTAssertEqualObjects(recipe.name, recipeName);
}

-(void)testARecipeContainsANumberOfItems
{
    Recipe *recipe = [[Recipe alloc] init:@"Recipe 1"];
    Item *item1 = [[Item alloc] init:@"Item 1"];
    Item *item2 = [[Item alloc] init:@"Item 2"];
    Item *item3 = [[Item alloc] init:@"Item 3"];

    [recipe addItem:item1];
    [recipe addItem:item2];
    [recipe addItem:item3];
    
    XCTAssertEqual([recipe.itemList count], 3);
}

-(void)testAListItemHasANameAndAnAmount
{
    NSString *itemName = @"Item 1";
    NSString *amount = @"1 can";
    ListItem *listItem = [[ListItem alloc] initWithName:itemName andAmount:amount];
    
    XCTAssertEqualObjects(listItem.name, itemName);
    XCTAssertEqualObjects(listItem.amount, amount);
}

@end