//
//  FISGithubAPIClient.h
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISGithubAPIClient : NSObject

+ (void) getGitHubReposWithConpletion: (void (^) (NSArray *repos))block;

+(void) getGitHubRepoSearchWithCompletion: (NSString *)search completion:(void (^) (NSArray *repos))block;

+ (void) checkIfStarredWithRepo: (NSString *)repoName
                     completion:(void (^)(BOOL isStarred))completionBlock;


@end
