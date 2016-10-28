#import <Foundation/Foundation.h>

@class SFObject;

@interface SFUniqueObjectFactory : NSObject

+ (instancetype)sharedFactory;

- (__kindof SFObject *)objectOfClass:(Class)objectClass withDictionary:(NSDictionary *)dictionary;

@end
