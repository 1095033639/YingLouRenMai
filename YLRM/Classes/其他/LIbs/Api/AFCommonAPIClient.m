#import "AFCommonAPIClient.h"
#import "Constants.h"
@implementation AFCommonAPIClient

// 初始化网络连接
+ (instancetype)sharedClient {

    static AFCommonAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *strBaseURL = [NSString stringWithFormat:@"%@/%@%@%@",mHost,mPort,mApp_Root,mApp];

        _sharedClient = [[AFCommonAPIClient alloc] initWithBaseURL:[NSURL URLWithString:strBaseURL]];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
        
        _sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        [_sharedClient.requestSerializer setTimeoutInterval:10.0];

        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}


- (void)getDataWithBlock:(void (^)(id, NSError *))block successBlock:(SuccessBlock)success failureBlock:(FailureBlock)failure requestParam:(id)params url:(NSString *)url
{
    [[AFCommonAPIClient sharedClient] POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }]; 
}


@end
