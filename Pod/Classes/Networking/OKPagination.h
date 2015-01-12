//
//  OKPagination.h
//  Pods
//
//  Created by Adam Holt on 21/12/2014.
//
//

#import <Foundation/Foundation.h>

@class OKCollectionResponse;

@interface OKPagination : NSObject

@property (nonatomic, assign) NSUInteger limit;
@property (nonatomic, assign) NSUInteger offset;

+ (instancetype)paginationFromResponse:(OKCollectionResponse*)collectionResponse;
+ (instancetype)paginationWithLimit:(NSUInteger)limit;
+ (instancetype)paginationWithLimit:(NSUInteger)limit offset:(NSUInteger)offset;

- (instancetype)initWithLimit:(NSUInteger)limit offset:(NSUInteger)offset;
@end
