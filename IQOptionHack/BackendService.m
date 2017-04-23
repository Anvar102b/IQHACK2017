//
//  BackendService.m
//  IQOptionHack
//
//  Created by Динар Габдуллин on 23.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import "BackendService.h"

@implementation BackendService

- (void)getSharesWithSum:(NSInteger)sum success:(void (^)(NSArray *arrayData))success {
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://138.68.83.16/predict/%li", sum]];
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:30.0];
    [request setHTTPMethod:@"GET"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSError *error;
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
//    [request setHTTPBody:postData];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"@ error %@", error.localizedDescription);
            success(false);
        }else{
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
            if (response) {
                switch (httpResponse.statusCode) {
                    case 200: {
                        NSArray* json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                        success(json);
                    }
                        break;
                    case 400:
                    case 401:
                    case 403:
                    case 404:
                    case 405:
                    case 406:
                        success(false);
                        break;
                    case 500: {
                        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                        NSLog(@"%@", json);
                        NSLog(@"Status Code: 500. Ошибка на сервере. Проверьте параметры и заголовок запроса.");
                        success(false);
                        break;
                    }
                    default: {
                        
                        break;
                    }
                }
            } else {
                
            }
        }
    }] resume];
    
//    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//    }] resume];

}

@end
