#import "SFObject.h"

@interface SFObject (Dictionary)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (void)fillWithDictionary:(NSDictionary *)dictionary;

@end
