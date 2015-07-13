//
//  FISGithubRepository.m
//  ReviewSession 3-16-14
//
//  Created by Joe Burgess on 3/16/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISGithubRepository.h"

@implementation FISGithubRepository

+ (FISGithubRepository*) repositoryFromJSON: (NSDictionary*) dictionary {
    
    FISGithubRepository *convertedRepo = [[FISGithubRepository alloc] init];
    convertedRepo.fullName = [dictionary objectForKey:@"full_name"];
    convertedRepo.htmlURL = [NSURL URLWithString:[dictionary objectForKey:@"html_url"]];
    NSNumber *repoID = dictionary[@"id"];
    convertedRepo.repositoryID = [repoID stringValue];
    
    return convertedRepo;
}

- (BOOL) isEqual:(id)object {
    if (object == NO) {
        return NO;
    } else if (![object isKindOfClass:[FISGithubRepository class]]) {
        return NO;
    }
    FISGithubRepository *otherRepo = object;
    return [self.repositoryID isEqual: otherRepo.repositoryID];
}


@end
