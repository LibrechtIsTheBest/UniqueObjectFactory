#import <Foundation/Foundation.h>

#pragma mark - Object

@interface SFObject : NSObject

@property (nonatomic) NSNumber *identifier;
@property (nonatomic, copy) NSString *name;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

#pragma mark - Factory

@interface SFUniqueObjectFactory : NSObject

+ (instancetype)sharedFactory;

- (__kindof SFObject *)objectWithDictionary:(NSDictionary *)dictionary;
- (__kindof SFObject *)objectWithIdentifier:(NSNumber *)identifier;

@end