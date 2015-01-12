//
//  OKResourceResponse.h
//  Pods
//
//  Created by Adam Holt on 12/01/2015.
//
//

#import <Foundation/Foundation.h>

@class MTLModel;

@interface OKResourceResponse : NSObject

@property (nonatomic, strong, readonly) NSURLSessionDataTask *task;

- (instancetype)initWithTask:(NSURLSessionDataTask*)task resource:(NSDictionary*)resource rootNode:(NSString*)rootNode;
- (MTLModel*)resource;
- (BOOL)successful;

@end
