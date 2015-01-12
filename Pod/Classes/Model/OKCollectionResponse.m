//
//  OKCollectionResponse.m
//  Pods
//
//  Created by Adam Holt on 21/12/2014.
//
//

#import "OKCollectionResponse.h"

#import "OKMovie.h"
#import <BlocksKit.h>

@interface OKCollectionResponse ()
@property (nonatomic, strong, readonly) NSString *rootNode;
@property (nonatomic, strong, readonly) NSDictionary *json;
- (Class)classForRootNode;
@end

@implementation OKCollectionResponse

- (instancetype)initWithTask:(NSURLSessionDataTask *)task collection:(NSArray *)collection rootNode:(NSString*)rootNode
{
    if (self = [super init]) {
        _task = task;
        
        NSError *error = nil;
        NSDictionary *jsonCollection = [NSJSONSerialization JSONObjectWithData:(NSData*)collection options:kNilOptions error:&error];
        
        if (error) {
            // Do some error handling? Throw an exception?
        } else {
            _json = jsonCollection;
            _rootNode = rootNode;
        }
    }
    
    return self;
}

- (NSArray*)collection
{
    NSArray *collectionNode = self.json[self.rootNode];
    
    if (!collectionNode) {
        collectionNode = @[];
    }
    
    NSValueTransformer *transformer;
    transformer = [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:self.classForRootNode];
    return [transformer transformedValue:collectionNode];
}

- (Class)classForRootNode
{
    if ([self.rootNode isEqualToString:@"movies"]) {
        return [OKMovie class];
    }
    
    return [OKMovie class];
}

- (BOOL)successful
{
    NSInteger statusCode = [(NSHTTPURLResponse*)self.task.response statusCode];
    return ((statusCode >= 200 || statusCode < 300) && ([_json[@"success"] isEqualToNumber:@(YES)]));
}

@end
