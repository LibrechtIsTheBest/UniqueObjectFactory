#import "SFObjectRegistry.h"
#import "SFObject+Dictionary.h"

@interface SFObjectRegistry ()

//@property (nonatomic) NSCache <NSNumber *, SFObject *> *pool;
@property (nonatomic) NSMutableDictionary <NSNumber *, SFObject *> *pool;

@end

@implementation SFObjectRegistry

#pragma mark - Initialization

+ (instancetype)sharedRegistry
{
    static SFObjectRegistry *sharedInstance = nil;
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
        _pool = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark - Public

- (__kindof SFObject *)objectOfClass:(Class)objectClass withDictionary:(NSDictionary *)dictionary
{
    SFObject *result = [self.pool objectForKey:dictionary[@"identifier"]];
    
    if (result == nil) {
        result = [[objectClass alloc] initWithDictionary:dictionary];
        [self registerObject:result];
    }
    else {
        [result fillWithDictionary:dictionary];
    }
    
    [self purge];
    
    return result;
}

#pragma mark - Private

- (void)registerObject:(SFObject *)object
{
    [self.pool setObject:object forKey:object.identifier];
}

- (void)purge
{
    for (SFObject *object in self.pool) {
        if (CFGetRetainCount((__bridge CFTypeRef)object) == 1) {
            [self.pool removeObjectForKey:object.identifier];
        }
    }
}

@end
