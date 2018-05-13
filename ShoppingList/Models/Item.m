#import "Item.h"

@implementation Item

-(id)init:(NSString *)name
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
    }
    
    return self;
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[Item class]]) {
        return NO;
    }
    
    return [[self.name lowercaseString] isEqualToString:[((Item *)object).name lowercaseString]];
}

@end
