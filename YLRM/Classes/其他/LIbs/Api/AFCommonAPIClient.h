#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

typedef void (^SuccessBlock)(id responseObject);
typedef void (^FailureBlock)(NSError * error);

@interface AFCommonAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

- (void)getDataWithBlock:(void (^)(id responseObject, NSError *error))block successBlock:(SuccessBlock)success failureBlock:(FailureBlock)failure requestParam:(id)params url:(NSString *)url;

@end
