#import "SFCommentObject.h"
#import "SFObject+Fillable.h"

#import "SFMacroUtils.h"

@implementation SFCommentObject

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
    _message = EscapeNull(dictionary[@"message"]);
}

@end

@implementation SFCommentObject (Fillable)

- (void)fillWithDictionary:(NSDictionary *)dictionary
{
    [super fillWithDictionary:dictionary];
    [self _privateFillWithDictionary:dictionary];
}

@end
