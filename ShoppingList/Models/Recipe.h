#import <Foundation/Foundation.h>
#import "Item.h"

@interface Recipe : NSObject

-(id)init:(NSString *)name;
-(void)addItem:(Item *)item;

@property(nonatomic) NSString *name;
@property(nonatomic) NSMutableArray *itemList;

@end
