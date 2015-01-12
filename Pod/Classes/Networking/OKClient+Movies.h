//
//  OKClient+Movies.h
//  Pods
//
//  Created by Adam Holt on 20/12/2014.
//
//

#import "OKClient.h"

@interface OKClient (Movies)

- (NSURLSessionDataTask*)moviesWithCompletion:(OKCollectionCompletionBlock)completion;
- (NSURLSessionDataTask*)movieWithId:(NSString*)movieId completion:(OKResourceCompletionBlock)completion;

@end
