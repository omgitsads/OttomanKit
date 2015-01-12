//
//  OKClientSpec.m
//  OttomanKit
//
//  Created by Adam Holt on 20/12/2014.
//  Copyright (c) 2014 Adam Holt. All rights reserved.
//

#import "OttomanKit.h"
#import "OKSpecHelper.h"

SpecBegin(OKClientSpec)

OKClient *client = [[OKClient alloc] init];
client.apiToken = @"testtoken";

describe(@"isAuthenticated", ^{
    it(@"should be authenticated", ^{
        expect(client.isAuthenticated).to.beTruthy();
    });
    
    it(@"should not be authenticated", ^{
        client.apiToken = nil;
        expect(client.isAuthenticated).to.beFalsy();
    });
});

describe(@"movies", ^{
    beforeEach(^{
        [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
            return [request.URL.host isEqualToString:@"couchpotato.com"];
        } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
            if ([request.URL.path containsString:@"movie.list"]){
                return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFileInBundle(@"movies.json",nil)
                                                        statusCode:200 headers:@{@"Content-Type":@"application/json"}];
            } else {
                return [OHHTTPStubsResponse responseWithError:nil];
            }
        }];
    });
    
    it(@"returns movies", ^AsyncBlock{
        [client moviesWithCompletion:^(OKCollectionResponse *collectionResponse, NSError *error) {
            expect(collectionResponse.collection.count).to.equal(2);
            done();
        }];
    });
});

describe(@"get movie", ^{
    beforeEach(^{
        [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
            return [request.URL.host isEqualToString:@"couchpotato.com"];
        } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
            if ([request.URL.path containsString:@"media.get"]){
                return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFileInBundle(@"movie.json",nil)
                                                        statusCode:200 headers:@{@"Content-Type":@"application/json"}];
            } else {
                return [OHHTTPStubsResponse responseWithError:nil];
            }
        }];
    });
    
    it(@"returns a movie", ^AsyncBlock{
        [client movieWithId:@"b42d9546a25b4ea2915ec24fc7aea77d" completion:^(OKResourceResponse *resourceResponse, NSError *error) {
            expect(((OKMovie*)resourceResponse.resource)._id).to.equal(@"b42d9546a25b4ea2915ec24fc7aea77d");
            done();
        }];
    });
});

SpecEnd