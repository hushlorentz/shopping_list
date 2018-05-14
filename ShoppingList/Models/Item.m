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

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    
    if (self)
    {
        self.name = [decoder decodeObjectForKey:@"name"];
    }
    
    return self;
}

- (BOOL)isEqual:(id)object
{
    return [[self.name lowercaseString] isEqualToString:[((Item *)object).name lowercaseString]];
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.name forKey:@"name"];
}

@end
