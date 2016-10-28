#import <Foundation/Foundation.h>
#import "SFObjectRegistry.h"
#import "SFAdObject.h"
#import "SFCommentObject.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        SFObjectRegistry *registry = [SFObjectRegistry sharedRegistry];
        
        SFAdObject *ad1 = [registry objectOfClass:[SFAdObject class] withDictionary:
            @{@"identifier": @1,
              @"name": @"skirt",
              @"price": @399}];
        SFCommentObject *comment1 = [registry objectOfClass:[SFCommentObject class] withDictionary:
            @{@"identifier": @10,
              @"name": @"comment",
              @"message": @"hello world"}];
        SFAdObject *ad2 = [registry objectOfClass:[SFAdObject class] withDictionary:
            @{@"identifier": @2,
              @"name": @"sweater",
              @"price": @599}];
        
        NSLog(@"%@", ad1);
        NSLog(@"%@", ad2);
        NSLog(@"%@", comment1);
        
        NSLog(@"ad1 Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)ad1));
        NSLog(@"ad2 Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)ad2));
        NSLog(@"comment1 Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)comment1));
        
        SFAdObject *newAd1 = [registry objectOfClass:[SFAdObject class] withDictionary:
            @{@"identifier": @1,
              @"name": @"skirt 2",
              @"price": @299}];
        
        NSLog(@"%@", ad1);
        NSLog(@"%@", ad2);
        NSLog(@"%@", newAd1);
        NSLog(@"%@", comment1);
        
        NSLog(@"ad1 Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)ad1));
        NSLog(@"ad2 Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)ad2));
        NSLog(@"newAd1 Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)newAd1));
        NSLog(@"comment1 Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)comment1));
        
//        [registry objectOfClass:[SFCommentObject class] withDictionary:
//            @{@"identifier": @10,
//              @"name": @"comment 2",
//              @"message": @"---"}];
        
        
        NSLog(@"%@", comment1);
        NSLog(@"comment1 Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)comment1));
        comment1 = nil;
        comment1 = [registry objectOfClass:[SFCommentObject class] withDictionary:
         @{@"identifier": @11,
           @"name": @"comment 2",
           @"message": @"---"}];
        
        NSLog(@"%@", comment1);
        NSLog(@"comment1 Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)comment1));
        
    }
    return 0;
}
