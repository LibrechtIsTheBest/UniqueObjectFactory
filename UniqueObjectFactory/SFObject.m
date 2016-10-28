#import "SFObject.h"
#import "SFObject+Dictionary.h"

#import "SFMacroUtils.h"

@implementation SFObject

@end

@implementation SFObject (Fillable)

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
