//
//  FISReposTableViewControllerSpec.m
//  github-repo-list
//
//  Created by Joe Burgess on 5/8/14.
//  Copyright 2014 Joe Burgess. All rights reserved.
//

#import "Specta.h"
#import <KIF.h>
#define EXP_SHORTHAND
#import <Expecta.h>
#import "FISReposTableViewController.h"


SpecBegin(FISReposTableViewController)

describe(@"FISReposTableViewController", ^{

    __block UITableView *tableView;
    __block UITableViewCell *secondCell;
    beforeAll(^{
        tableView = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"Repo Table View"];
        NSIndexPath *ip = [NSIndexPath indexPathForRow:1 inSection:0];
        secondCell = [tester waitForCellAtIndexPath:ip inTableViewWithAccessibilityIdentifier:@"Repo Table View"];
    });
    
    describe(@"TableVeiw", ^{
        it(@"Should have 1 section", ^{
            expect([tableView numberOfSections]).to.equal(1);
        });
        
        it(@"Should have two cells", ^{
            expect([tableView numberOfRowsInSection:0]).to.equal(2);
        });
    });

    describe(@"TableView Cells", ^{
        it(@"Should have a textLabel", ^{
            expect(secondCell.textLabel).toNot.beNil();
        });
        
        it(@"Should have the correct cells", ^{
            expect(secondCell.textLabel.text).to.equal(@"wycats/merb-core");
        });
    });
    
});

SpecEnd
