//
//  OKResourceResponse.m
//  Pods
//
//  Created by Adam Holt on 12/01/2015.
//
//

#import "OKResourceResponse.h"

#import "OKMovie.h"

@interface OKResourceResponse ()
@property (nonatomic, strong, readonly) NSString *rootNode;
@property (nonatomic, strong, readonly) NSDictionary *json;
- (Class)classForResource:(NSDictionary*)resource;
@end

@implementation OKResourceResponse

- (instancetype)initWithTask:(NSURLSessionDataTask *)task resource:(NSDictionary *)resource rootNode:(NSString *)rootNode
{
    if (self = [super init]) {
        _task = task;
        
        NSError *error = nil;
        NSDictionary *jsonResource = [NSJSONSerialization JSONObjectWithData:(NSData*)resource options:kNilOptions error:&error];
        
        if (error) {
            // Do some error handling? Throw an exception?
        } else {
            _json = jsonResource;
            _rootNode = rootNode;
        }
    }
    
    return self;
}

- (MTLModel*)resource
{
    NSDictionary *resourceNode = self.json[self.rootNode];
    
    if (!resourceNode) {
        resourceNode = @{};
    }
    
    NSValueTransformer *transformer;
    transformer = [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[self classForResource:resourceNode]];
    
    return [transformer transformedValue:resourceNode];
}

- (Class)classForResource:(NSDictionary*)resource
{
    if ([resource[@"type"] isEqualToString:@"movie"]) {
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
