//
//  BackendService.h
//  IQOptionHack
//
//  Created by Динар Габдуллин on 23.04.17.
//  Copyright © 2017 Anvar Basharov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BackendService : NSObject

- (void)getSharesWithSum:(NSInteger)sum success:(void (^)(NSArray *arrayData))success;

@end
