//
//  OKClient+Movies.m
//  Pods
//
//  Created by Adam Holt on 20/12/2014.
//
//

#import "OKClient+Movies.h"
#import "OKClient+Requests.h"

#import "OKMovie.h"

@implementation OKClient (Movies)
- (NSURLSessionDataTask*)moviesWithCompletion:(OKCollectionCompletionBlock)completion
{
    return [self requestWithPath:@"movie.list" parameters:@{} rootNode:@"movies" completion:completion];
}
@end
