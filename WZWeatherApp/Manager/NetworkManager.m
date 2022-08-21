//
//  NetworkManager.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import "NetworkManager.h"
#import "AFNetworking.h"

typedef void (^successBlock)(NSURLSessionDataTask * _Nonnull, id _Nullable);

@implementation NetworkManager{
    AFHTTPSessionManager * _manager;
}

+ (instancetype)shared {
    static id _shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _shared = [[self alloc]init];
    });
    return _shared;
}

-(instancetype)init{
    if(self = [super init]){
        _manager = [AFHTTPSessionManager manager];
    }
    return self;
}

- (NSURLSessionDataTask *)simpleGet:(NSString *)URLString parameters:(id)parameters success:(successBlock)success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    return [_manager GET:URLString parameters:parameters headers:nil progress:nil success:success failure:failure];
}

@end
