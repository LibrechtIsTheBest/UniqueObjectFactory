#import "SFAdObject.h"
#import "SFObject+Fillable.h"

#import "SFMacroUtils.h"

@interface SFAdObject ()

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

- (void)_privateFillWithDictionary:(NSDictionary *)dictionary
{
    _price = EscapeNull(dictionary[@"price"]);
}

@end

@implementation SFAdObject (Fillable)

- (void)fillWithDictionary:(NSDictionary *)dictionary
{
    [super fillWithDictionary:dictionary];
    [self _privateFillWithDictionary:dictionary];
}

@end
