#import <Foundation/Foundation.h>

@interface Item : NSObject<NSCoding>

-(id)init:(NSString *)name;

@property(nonatomic) NSString *name;

@end
