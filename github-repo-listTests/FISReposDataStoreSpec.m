//
//  FISReposDataStoreSpec.m
//  github-repo-list
//
//  Created by Joe Burgess on 5/6/14.
//  Copyright 2014 Joe Burgess. All rights reserved.
//

#import "Specta.h"
#import "FISReposDataStore.h"
#define EXP_SHORTHAND
#import <Expecta.h>
#import <OHHTTPStubs.h>
#import "FISGithubRepository.h"


SpecBegin(FISReposDataStore)

describe(@"FISReposDataStore", ^{
    
//    beforeAll(^{
//        [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
//            if ([request.URL.host isEqualToString:@"api.github.com"]&&[request.URL.path isEqualToString:@"/repositories"])
//            {
//                return YES;
//            }
//            else
//            {
//                return NO;
//            }
//        } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
//            return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFileInBundle(@"repositories.json", nil) statusCode:200 headers:@{@"Content-Type": @"application/json"}];
//        }];
//    });

    beforeEach(^{

    });

    it(@"Should alloc the repositories array", ^{
        FISReposDataStore *dataStore = [[FISReposDataStore alloc] init];
        expect(dataStore.repositories).toNot.beNil();
    });

    describe(@"Shared singleton method", ^{
        it(@"Should have a sharedDataStore class method", ^{
            expect([FISReposDataStore class]).to.respondTo(@selector(sharedDataStore));
        });
        
        it(@"Should be a singleton", ^{
            expect([FISReposDataStore sharedDataStore]).to.beIdenticalTo([FISReposDataStore sharedDataStore]);
        });
    });

//    describe(@"getRepositories Method", ^{
//
//        it(@"Should set success to YES if everything works", ^AsyncBlock{
//            FISReposDataStore *dataStore = [[FISReposDataStore alloc] init];
//            [dataStore getRepositoriesWithCompletion:^(BOOL success) {
//                expect(success).to.beTruthy;
//                done();
//            }];
//        });
//
//        it(@"Should Get The Correct Repositories", ^AsyncBlock{
//
//            FISGithubRepository *repo1 = [[FISGithubRepository alloc] init];
//            repo1.repositoryID=@"1";
//            repo1.fullName=@"mojombo/grit";
//            repo1.htmlURL=[NSURL URLWithString:@"https://github.com/mojombo/grit"];
//            FISGithubRepository *repo2 = [[FISGithubRepository alloc] init];
//            repo2.repositoryID = @"26";
//            repo2.fullName = @"wycats/merb-core";
//            repo2.htmlURL=[NSURL URLWithString:@"https://github.com/wycats/merb-core"];
//            NSArray *correctRepos = [[NSMutableArray alloc] initWithArray:@[repo1,repo2]];
//            FISReposDataStore *dataStore = [[FISReposDataStore alloc] init];
//
//            [dataStore getRepositoriesWithCompletion:^(BOOL success) {
//                expect([dataStore.repositories count]).to.equal(2);
//                expect(dataStore.repositories).to.equal(correctRepos);
//                done();
//            }];
//        });
//    });

    afterEach(^{

    });
    
    afterAll(^{

    });
});

SpecEnd
