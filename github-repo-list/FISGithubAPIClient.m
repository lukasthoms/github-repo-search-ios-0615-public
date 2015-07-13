//
//  FISGithubAPIClient.m
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISGithubAPIClient.h"
#import <AFNetworking.h>

@implementation FISGithubAPIClient

+ (void) getGitHubReposWithConpletion: (void (^) (NSArray *repos))block {
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    [sessionManager GET:@"https://api.github.com/repositories?access_token=71eeda7b06908ec8361a9b7459392bf82cc0b612" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error.localizedDescription);
    }];
    

    
}

+(void) getGitHubRepoSearchWithCompletion: (NSString *)search completion:(void (^) (NSArray *repos))block {
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    NSDictionary *params = @{ @"access_token" : @"71eeda7b06908ec8361a9b7459392bf82cc0b612",
                              @"q" : search };
    
    [sessionManager GET:@"https://api.github.com/search/repositories" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"Used URL:%@", task.originalRequest.URL);
        
        block(responseObject[@"items"]);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Search Error: %@", error.localizedDescription);
    }];
}

+ (void) checkIfStarredWithRepo: (NSString *)repoName
                     completion:(void (^)(BOOL isStarred))completionBlock {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.github.com/%@?client_id=39e42e107aedb4330920&client_secret=81c744473f3f8bfb4fbe633d38d84260c3757780&access_token=71eeda7b06908ec8361a9b7459392bf82cc0b612", repoName]];
    
    NSURLSession *sesh = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [sesh dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode == 204) {
            completionBlock(YES);
        } else if (httpResponse.statusCode == 404) {
            completionBlock(NO);
        }
    }];
    [task resume];
                                  
}


@end
