#import "SFObject.h"

#pragma mark - Object

@protocol SFObjectFillable <NSObject>

- (void)fillWithDictionary:(NSDictionary *)dictionary;

@end

@interface SFObject (Protected) <SFObjectFillable>

@end

#pragma mark - Factory

@protocol SFUniqueObjectFactoryRegistry <NSObject>

@property (nonatomic) NSCache <NSNumber *, SFObject *> *pool;

- (__kindof SFObject *)objectOfClass:(Class)class withDictionary:(NSDictionary *)dictionary;

- (void)registerObject:(SFObject *)object;

@end

@interface SFUniqueObjectFactory (Protected) <SFUniqueObjectFactoryRegistry>

@end
