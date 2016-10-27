#import "SFObject.h"

#pragma mark - Object

@interface SFCommentObject : SFObject

@property (nonatomic, copy) NSString *message;

@end

#pragma mark - Factory

@interface SFUniqueCommentObjectFactory : SFUniqueObjectFactory

@end
