#import "SFCommentObject.h"
#import "SFObject+Dictionary.h"

#import "SFMacroUtils.h"

@implementation SFCommentObject

@end

@implementation SFCommentObject (Fillable)

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
