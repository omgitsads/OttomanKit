//
//  OKClient.m
//  
//
//  Created by Adam Holt on 20/12/2014.
//
//

#import "AFHTTPSessionManager.h"
#import "OKCollectionResponse.h"

typedef void (^OKCollectionCompletionBlock)(OKCollectionResponse *collectionResponse, NSError *error);

extern NSString * const OKClientErrorDomain;

@interface OKClient : AFHTTPSessionManager

@property (nonatomic, strong) NSString *apiToken;

+ (instancetype)sharedClient;

+ (NSURL*)APIBaseURL;

- (BOOL)isAuthenticated;

@end