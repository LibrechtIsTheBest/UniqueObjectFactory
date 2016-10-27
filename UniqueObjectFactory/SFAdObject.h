#import "SFObject.h"

#pragma mark - Object

@interface SFAdObject : SFObject

@property (nonatomic) NSNumber *price;

@end

#pragma mark - Factory

@interface SFUniqueAdObjectFactory : SFUniqueObjectFactory

@end