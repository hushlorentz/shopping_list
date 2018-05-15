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

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    
    if (self)
    {
        self.name = [decoder decodeObjectForKey:@"name"];
        self.amount = [decoder decodeObjectForKey:@"amount"];
    }
    
    return self;
}

- (BOOL)isEqual:(id)object
{
    BOOL namesAreEqual = [[self.name lowercaseString] isEqualToString:[((ListItem *)object).name lowercaseString]];
    BOOL amountsAreEqual = [[self.amount lowercaseString] isEqualToString:[((ListItem *)object).amount lowercaseString]];
 
    return namesAreEqual && amountsAreEqual;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.amount forKey:@"amount"];
}

@end
