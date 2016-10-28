#import <Foundation/Foundation.h>

@class SFObject;

@interface SFObjectRegistry : NSObject

+ (instancetype)sharedRegistry;

- (__kindof SFObject *)objectOfClass:(Class)objectClass withDictionary:(NSDictionary *)dictionary;

@end
