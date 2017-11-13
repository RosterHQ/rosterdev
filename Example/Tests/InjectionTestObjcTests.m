//
//  InjectionTestObjcTests.m
//  roster
//
//  Created by Christopher G Prince on 8/9/17.
//  Copyright © 2017 roster. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RosterDevInjectTestObjC.h"

@interface InjectionTestObjcTests : XCTestCase
@end

@implementation InjectionTestObjcTests

- (void)setUp {
    [super setUp];
    [RosterDevInjectTestObjC session].runTestsMultipleTimes = NO;
    [[RosterDevInjectTestObjC session] reset];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testCaseNamesGetSorted;
{
    [[RosterDevInjectTestObjC session] setTest:@"d" valueTo:NO];
    [[RosterDevInjectTestObjC session] setTest:@"c" valueTo:NO];
    [[RosterDevInjectTestObjC session] setTest:@"b" valueTo:NO];
    [[RosterDevInjectTestObjC session] setTest:@"a" valueTo:NO];
    [[RosterDevInjectTestObjC session] setTest:@"f" valueTo:NO];
    [[RosterDevInjectTestObjC session] setTest:@"g" valueTo:NO];
    [[RosterDevInjectTestObjC session] setTest:@"e" valueTo:NO];

    NSArray *sortedNames = [RosterDevInjectTestObjC session].sortedTestCaseNames;
    
    NSArray *comparisonArray = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g"];
    
    XCTAssert([sortedNames isEqualToArray:comparisonArray]);
}

- (void) testTestDoesNotRunByDefault {
    BOOL testRan = NO;
    RosterDevInjectTestIf(@"Test1", {
        testRan = YES;
    });
    XCTAssert(!testRan);
}

- (void) testTestRunsIfYouTurnItOn {
    [[RosterDevInjectTestObjC session] setTest:@"Test1" valueTo:YES];
    BOOL testRan = NO;
    RosterDevInjectTestIf(@"Test1", {
        testRan = YES;
    });
    XCTAssert(testRan);
}

- (void) testTestOnlyRunOnceIfYouTurnItOn {
    [[RosterDevInjectTestObjC session] setTest:@"Test1" valueTo:YES];
    
    BOOL testRan = NO;
    RosterDevInjectTestIf(@"Test1", {
        testRan = YES;
    });
    XCTAssert(testRan);
    
    testRan = NO;
    RosterDevInjectTestIf(@"Test1", {
        testRan = YES;
    });
    XCTAssert(!testRan);
}

- (void) testTestRunMoreThanOnceIfYouAllowIt {
    [RosterDevInjectTestObjC session].runTestsMultipleTimes = YES;
    [[RosterDevInjectTestObjC session] setTest:@"Test1" valueTo:YES];
    
    BOOL testRan = NO;
    RosterDevInjectTestIf(@"Test1", {
        testRan = YES;
    });
    XCTAssert(testRan);
    
    testRan = NO;
    RosterDevInjectTestIf(@"Test1", {
        testRan = YES;
    });
    XCTAssert(testRan);
}

- (void) testMultipleStatementsRun {
    [[RosterDevInjectTestObjC session] setTest:@"Test1" valueTo:YES];
    
    BOOL testRan = NO;
    BOOL testRan2 = NO;
    
    RosterDevInjectTestIf(@"Test1",
        testRan = YES;
        testRan2 = YES;
    );
    
    XCTAssert(testRan);
    XCTAssert(testRan2);
}

- (void) testMultipleStatementsDoNotRun {
    BOOL testRan = NO;
    BOOL testRan2 = NO;
    
    RosterDevInjectTestIf(@"Test1",
        testRan = YES;
        testRan2 = YES;
    );
    
    XCTAssert(!testRan);
    XCTAssert(!testRan2);
}

@end
