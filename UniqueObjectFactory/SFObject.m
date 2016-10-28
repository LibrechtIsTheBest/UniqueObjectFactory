#import "SFObject.h"
#import "SFObject+Fillable.h"

#import "SFMacroUtils.h"

@implementation SFObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        [self fillWithDictionary:dictionary];
    }
    return self;
}

@end

@implementation SFObject (Fillable)

- (void)fillWithDictionary:(NSDictionary *)dictionary
{
    _identifier = EscapeNull(dictionary[@"identifier"]);
    _name = EscapeNull(dictionary[@"name"]);
}

@end
