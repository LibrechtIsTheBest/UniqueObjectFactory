#import "SFAdObject.h"
#import "SFObject+Registry.h"

#import "SFMacroUtils.h"

#pragma mark - Object

@interface SFAdObject () <SFObjectFillable>

@end

@implementation SFAdObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self) {
        [self _privateFillWithDictionary:dictionary];
    }
    return self;
}

- (void)fillWithDictionary:(NSDictionary *)dictionary
{
    [super fillWithDictionary:dictionary];
    [self _privateFillWithDictionary:dictionary];
}

- (void)_privateFillWithDictionary:(NSDictionary *)dictionary
{
    _price = EscapeNull(dictionary[@"price"]);
}

@end

#pragma mark - Factory

@implementation SFUniqueAdObjectFactory

+ (instancetype)sharedFactory
{
    static SFUniqueAdObjectFactory *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (SFAdObject *)objectWithDictionary:(NSDictionary *)dictionary
{
    return [self objectOfClass:[SFAdObject class] withDictionary:dictionary];
}

@end