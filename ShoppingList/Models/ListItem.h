#import <Foundation/Foundation.h>

@interface ListItem : NSObject

-(id)initWithName:(NSString *)name andAmount:(NSString *)amount;

@property(nonatomic) NSString *name;
@property(nonatomic) NSString *amount;

@end
