#import "SFUniqueObjectFactory.h"
#import "SFObject+Dictionary.h"

@interface SFUniqueObjectFactory ()

@property (nonatomic) NSCache <NSNumber *, SFObject *> *pool;

@end

@implementation SFUniqueObjectFactory

#pragma mark - Initialization

+ (instancetype)sharedFactory
{
    static SFUniqueObjectFactory *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pool = [[NSCache alloc] init];
    }
    return self;
}

#pragma mark - Public

- (__kindof SFObject *)objectOfClass:(Class)objectClass withDictionary:(NSDictionary *)dictionary
{
    SFObject *result = [self.pool objectForKey:dictionary[@"identifier"]];
    
    if (result == nil) {
        result = [[objectClass alloc] initWithDictionary:dictionary];
    }
    else {
        [result fillWithDictionary:dictionary];
    }
    [self registerObject:result];
    
    return result;
}

#pragma mark - Private

- (void)registerObject:(SFObject *)object
{
    [self.pool setObject:object forKey:object.identifier];
}

@end
