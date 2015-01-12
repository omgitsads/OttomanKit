//
//  OKClient+Requests.m
//  Pods
//
//  Created by Adam Holt on 20/12/2014.
//
//

#import "OKClient+Requests.h"
#import "OKCollectionResponse.h"

@implementation OKClient (Requests)

- (NSURLSessionDataTask*)requestWithPath:(NSString *)path parameters:(NSDictionary *)parameters rootNode:(NSString *)rootNode completion:(OKCollectionCompletionBlock)completion
{
    NSParameterAssert(path);
    
    NSString *apiPath = [NSString stringWithFormat:@"/api/%@/%@", self.apiToken, path];
    
    return [self GET:apiPath parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if (!completion) {
            return;
        }
        
        if (responseObject) {
            OKCollectionResponse *collection = [[OKCollectionResponse alloc] initWithTask:task
                                                                               collection:responseObject
                                                                                 rootNode:rootNode];
            
            completion(collection, nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

@end
