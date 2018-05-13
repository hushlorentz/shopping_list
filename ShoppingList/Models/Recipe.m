#import "Recipe.h"

@implementation Recipe

-(id)init:(NSString *)name
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.itemList = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)addItem:(Item *)item
{
    [self.itemList addObject:item];
}

@end
