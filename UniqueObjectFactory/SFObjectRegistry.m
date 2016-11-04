#import "SFObjectRegistry.h"
#import "SFObject+Dictionary.h"

#pragma mark -

@interface SFObjectWeakWrapper : NSObject

@property (weak, nonatomic) SFObject *object;

+ (instancetype)wrappedObjectWithObject:(SFObject *)object;

@end

@implementation SFObjectWeakWrapper

+ (instancetype)wrappedObjectWithObject:(SFObject *)object
{
    SFObjectWeakWrapper *instance = [[self alloc] init];
    instance.object = object;
    return instance;
}

@end

#pragma mark -

@interface SFObjectRegistry ()

@property (nonatomic) NSMutableDictionary <NSNumber *, SFObjectWeakWrapper *> *pool;

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
    SFObject *result = [self.pool objectForKey:dictionary[@"identifier"]].object;
    
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
    [self.pool setObject:[SFObjectWeakWrapper wrappedObjectWithObject:object] forKey:object.identifier];
}

- (void)purge
{
    NSMutableArray <NSNumber *> *keysOfObjectsToDelete = [NSMutableArray array];
    for (NSNumber *identifier in self.pool) {
        if (self.pool[identifier].object == nil) {
            [keysOfObjectsToDelete addObject:identifier];
        }
    }
    [self.pool removeObjectsForKeys:keysOfObjectsToDelete];
}

@end
