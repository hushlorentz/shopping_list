#import "ListItem.h"

@implementation ListItem

-(id)initWithName:(NSString *)name andAmount:(NSString *)amount
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.amount = amount;
    }
    
    return self;
}


@end
