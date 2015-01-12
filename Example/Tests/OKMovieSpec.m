//
//  OKMovieSpec.m
//  OttomanKit
//
//  Created by Adam Holt on 21/12/2014.
//  Copyright (c) 2014 Adam Holt. All rights reserved.
//

#import "OttomanKit.h"
#import "OKSpecHelper.h"

SpecBegin(OKMovieSpec)

OKClient *client = [[OKClient alloc] init];
client.apiToken = @"testtoken";

beforeAll(^{
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

describe(@"attributes", ^{
    it(@"populates attributes", ^AsyncBlock{
        [client movieWithId:@"" completion:^(OKResourceResponse *resourceResponse, NSError *error) {
            OKMovie *movie = (OKMovie*)resourceResponse.resource;
            
            expect(movie._id).toNot.beNil;
            expect(movie.title).toNot.beNil;
            expect(movie.tagline).toNot.beNil;
            expect(movie.mpaa).toNot.beNil;
            expect(movie.imdb).toNot.beNil;
            expect(movie.year).toNot.beNil;
            expect(movie.year).to.equal(2012);
            expect(movie.released).toNot.beNil;
            done();
        }];
    });
});

describe(@"posters", ^{
    it(@"has 3 posters", ^AsyncBlock{
        [client movieWithId:@"" completion:^(OKResourceResponse *resourceResponse, NSError *error) {
            OKMovie *movie = (OKMovie*)resourceResponse.resource;
            expect(movie.posters).to.haveCountOf(3);
            done();
        }];
    });
    
    it(@"returns an array of NSURLs", ^AsyncBlock{
        [client movieWithId:@"" completion:^(OKResourceResponse *resourceResponse, NSError *error) {
            OKMovie *movie = (OKMovie*)resourceResponse.resource;
            expect(movie.posters.firstObject).to.beInstanceOf([NSURL class]);
            done();
        }];
    });
});

SpecEnd