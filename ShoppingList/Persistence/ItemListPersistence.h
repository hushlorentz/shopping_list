#import <Foundation/Foundation.h>

@interface ItemListPersistence : NSObject

+ (void)saveItemList:(NSMutableArray *)itemList toFile:(NSString *)fileName;
+ (NSArray *)loadItemListFromFile:(NSString *)fileName;

@end
