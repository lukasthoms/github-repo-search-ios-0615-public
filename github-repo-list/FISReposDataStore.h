//
//  FISReposDataStore.h
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISGithubAPIClient.h"
#import "FISGithubRepository.h"

@interface FISReposDataStore : NSObject

@property (strong, nonatomic) NSMutableArray *repositories;

+ (instancetype)sharedDataStore;
- (void) refreshReposWithCompletion: (void (^)(BOOL succeeded))block;
- (void) searchReposWithCompletion: (NSString*)search completion:(void (^)(BOOL completion))block;

@end
