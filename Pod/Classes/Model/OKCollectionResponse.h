//
//  OKCollectionResponse.h
//  Pods
//
//  Created by Adam Holt on 21/12/2014.
//
//

#import <Foundation/Foundation.h>

@interface OKCollectionResponse : NSObject

@property (nonatomic, strong, readonly) NSURLSessionDataTask *task;

- (instancetype)initWithTask:(NSURLSessionDataTask*)task collection:(NSArray*)collection rootNode:(NSString*)rootNode;
- (NSArray*)collection;
- (BOOL)successful;

@end
