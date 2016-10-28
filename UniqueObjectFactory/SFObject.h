#import <Foundation/Foundation.h>

@interface SFObject : NSObject

@property (nonatomic) NSNumber *identifier;
@property (nonatomic, copy) NSString *name;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
