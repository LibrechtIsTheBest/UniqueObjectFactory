#import <Foundation/Foundation.h>
#import "SFUniqueObjectFactory.h"
#import "SFAdObject.h"
#import "SFCommentObject.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        SFUniqueObjectFactory *factory = [SFUniqueObjectFactory sharedFactory];
        
        SFAdObject *ad1 = [factory objectOfClass:[SFAdObject class] withDictionary:
            @{@"identifier": @1,
              @"name": @"skirt",
              @"price": @399}];
        SFCommentObject *comment1 = [factory objectOfClass:[SFCommentObject class] withDictionary:
            @{@"identifier": @10,
              @"name": @"comment",
              @"message": @"hello world"}];
        
        SFAdObject *ad2 = [factory objectOfClass:[SFAdObject class] withDictionary:
            @{@"identifier": @2,
              @"name": @"sweater",
              @"price": @599}];
        
        NSLog(@"%@ %@", ad1, ad1.name);
        NSLog(@"%@ %@", ad2, ad2.name);
        NSLog(@"%@ %@", comment1, comment1.name);
        
        SFAdObject *newAd1 = [factory objectOfClass:[SFAdObject class] withDictionary:
            @{@"identifier": @1,
              @"name": @"skirt 2",
              @"price": @299}];
        
        NSLog(@"%@ %@", ad1, ad1.name);
        NSLog(@"%@ %@", ad2, ad2.name);
        NSLog(@"%@ %@", newAd1, newAd1.name);
        NSLog(@"%@ %@", comment1, comment1.name);
    }
    return 0;
}
