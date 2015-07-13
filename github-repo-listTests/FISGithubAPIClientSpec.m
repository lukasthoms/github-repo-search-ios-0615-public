//
//  FISGithubAPIClientSpec.m
//  github-repo-list
//
//  Created by Joe Burgess on 5/6/14.
//  Copyright 2014 Joe Burgess. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import <Expecta.h>
#import "FISGithubAPIClient.h"
#import <OHHTTPStubs.h>


SpecBegin(FISGithubAPIClient)

//describe(@"FISGithubAPIClient", ^{
//
//    __block NSArray *repositoryArray;
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
//        
//        NSData *data = [NSData dataWithContentsOfFile:OHPathForFileInBundle(@"repositories.json", nil)];
//        repositoryArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//    });
//    
//
//    describe(@"Get Repositories", ^{
//
//        it(@"Should respond to getrepositories class method selector", ^{
//            expect([FISGithubAPIClient class]).to.respondTo(@selector(getRepositoriesWithCompletion:));
//        });
//
//        it(@"Should get repositories", ^AsyncBlock{
//            [FISGithubAPIClient getRepositoriesWithCompletion:^(NSArray *repoDictionaries) {
//                expect(repoDictionaries).toNot.beNil();
//                expect(repoDictionaries.count).to.equal(2);
//                expect(repoDictionaries).to.equal(repositoryArray);
//                done();
//            }];
//        });
//    });
//});

SpecEnd
