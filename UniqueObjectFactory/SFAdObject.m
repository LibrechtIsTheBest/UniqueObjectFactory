#import "SFAdObject.h"
#import "SFObject+Dictionary.h"

#import "SFMacroUtils.h"

@interface SFAdObject ()

@end

@implementation SFAdObject

@end

@implementation SFAdObject (Fillable)

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
