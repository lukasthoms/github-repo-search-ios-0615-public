//
//  FISReposDataStore.m
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISReposDataStore.h"

@implementation FISReposDataStore

+ (instancetype)sharedDataStore {
    static FISReposDataStore *_sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataStore = [[FISReposDataStore alloc] init];
    });
    
    return _sharedDataStore;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _repositories=[NSMutableArray new];
    }
    return self;
}

- (void) refreshReposWithCompletion:(void (^)(BOOL))block {
    [self.repositories removeAllObjects];
    
    [FISGithubAPIClient getGitHubReposWithConpletion:^(NSArray *repos) {
        for (NSDictionary *repo in repos) {
            FISGithubRepository *newRepo = [FISGithubRepository repositoryFromJSON:repo];
            [self.repositories addObject:newRepo];
        }
        block(YES);
    }];
}



- (void) searchReposWithCompletion: (NSString*)search completion:(void (^)(BOOL completion))block {
    [self.repositories removeAllObjects];
    
    [FISGithubAPIClient getGitHubRepoSearchWithCompletion:search completion:^(NSArray *repos) {
        for (NSDictionary *repo in repos) {
            FISGithubRepository *newRepo = [FISGithubRepository repositoryFromJSON:repo];
            [self.repositories addObject:newRepo];
        }
        block(YES);
    }];
    
    
}



@end
