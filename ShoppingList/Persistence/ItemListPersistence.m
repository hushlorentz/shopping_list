#import "ItemListPersistence.h"

@implementation ItemListPersistence

+ (NSString *)getDocumentsFilePathFromFileName:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

+ (void)saveItemList:(NSArray *)itemList toFile:(NSString *)fileName
{
    NSString *itemFilePath = [ItemListPersistence getDocumentsFilePathFromFileName:fileName];
    [NSKeyedArchiver archiveRootObject:itemList toFile:itemFilePath];
}

+ (NSArray *)loadItemListFromFile:(NSString *)fileName
{
    NSString *itemFilePath = [ItemListPersistence getDocumentsFilePathFromFileName:fileName];  
    return [NSKeyedUnarchiver unarchiveObjectWithFile:itemFilePath];
}

@end
