#import "SFCommentObject.h"
#import "SFObject+Registry.h"

#import "SFMacroUtils.h"

#pragma mark - Object

@implementation SFCommentObject

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
    _message = EscapeNull(dictionary[@"message"]);
}
@end

#pragma mark - Factory

@implementation SFUniqueCommentObjectFactory

+ (instancetype)sharedFactory
{
    static SFUniqueCommentObjectFactory *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (SFCommentObject *)objectWithDictionary:(NSDictionary *)dictionary
{
    return [self objectOfClass:[SFCommentObject class] withDictionary:dictionary];
}

@end