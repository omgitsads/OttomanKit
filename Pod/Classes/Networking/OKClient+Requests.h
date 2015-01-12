//
//  OKClient+Requests.h
//  Pods
//
//  Created by Adam Holt on 20/12/2014.
//
//

#import "OKClient.h"



@interface OKClient (Requests)

- (NSURLSessionDataTask*)requestWithPath:(NSString*)path parameters:(NSDictionary*)parameters rootNode:(NSString*)rootNode completion:(OKResourceCompletionBlock)completion;
- (NSURLSessionDataTask*)collectionRequestWithPath:(NSString*)path parameters:(NSDictionary*)parameters rootNode:(NSString*)rootNode completion:(OKCollectionCompletionBlock)completion;

@end
