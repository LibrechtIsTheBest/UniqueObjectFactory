#import "SFObject.h"
#import "SFObject+Registry.h"

#import "SFMacroUtils.h"

#pragma mark - Object

@interface SFObject ()

@end

@implementation SFObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        [self fillWithDictionary:dictionary];
    }
    return self;
}

- (void)fillWithDictionary:(NSDictionary *)dictionary
{
    _identifier = EscapeNull(dictionary[@"identifier"]);
    _name = EscapeNull(dictionary[@"name"]);
}

@end

#pragma mark - Factory

@implementation SFUniqueObjectFactory

@synthesize pool = _pool;

+ (instancetype)sharedFactory
{
    @throw [NSException exceptionWithName:NSObjectNotAvailableException reason:@"SFUniqueObjectFactory is an abstract class" userInfo:nil];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pool = [[NSCache alloc] init];
    }
    return self;
}

- (__kindof SFObject *)objectWithDictionary:(NSDictionary *)dictionary
{
    return [self objectOfClass:[SFObject class] withDictionary:dictionary];
}

- (__kindof SFObject *)objectOfClass:(Class)class withDictionary:(NSDictionary *)dictionary
{
    SFObject *result = [self.pool objectForKey:dictionary[@"identifier"]];

    if (result == nil) {
        result = [[class alloc] initWithDictionary:dictionary];
    }
    else {
        [result fillWithDictionary:dictionary];
    }
    [self registerObject:result];

    return result;
}

- (void)registerObject:(SFObject *)object
{
    [self.pool setObject:object forKey:object.identifier];
}

@end