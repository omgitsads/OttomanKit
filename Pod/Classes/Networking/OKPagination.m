//
//  OKPagination.m
//  Pods
//
//  Created by Adam Holt on 21/12/2014.
//
//

#import "OKPagination.h"
#import "OKCollectionResponse.h"

@implementation OKPagination
+ (instancetype)paginationFromResponse:(OKCollectionResponse *)collectionResponse
{
    NSURLSessionDataTask *task = collectionResponse.task;
    NSURLRequest *request = task.currentRequest;
    NSURL *url = request.URL;
    NSString *query = url.query;
    
    return [self paginationWithLimit:25 offset:0];
}

+ (instancetype)paginationWithLimit:(NSUInteger)limit
{
    return [self paginationWithLimit:limit offset:0];
}

+ (instancetype)paginationWithLimit:(NSUInteger)limit offset:(NSUInteger)offset
{
    return [[OKPagination alloc] initWithLimit:25 offset:0];
}

- (instancetype)initWithLimit:(NSUInteger)limit offset:(NSUInteger)offset
{
    if (self = [super init]) {
        _limit = limit;
        _offset = offset;
    }
    
    return self;
}

@end
