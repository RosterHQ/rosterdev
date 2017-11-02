//
//  InjectionTestObjcTests.m
//  roster
//
//  Created by Christopher G Prince on 8/9/17.
//  Copyright © 2017 roster. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InjectTestObjC.h"

@interface InjectionTestObjcTests : XCTestCase
@end

@implementation InjectionTestObjcTests

- (void)setUp {
    [super setUp];
    [InjectTestObjC session].runTestsMultipleTimes = NO;
    [[InjectTestObjC session] reset];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testCaseNamesGetSorted;
{
    [[InjectTestObjC session] setTest:@"d" valueTo:NO];
    [[InjectTestObjC session] setTest:@"c" valueTo:NO];
    [[InjectTestObjC session] setTest:@"b" valueTo:NO];
    [[InjectTestObjC session] setTest:@"a" valueTo:NO];
    [[InjectTestObjC session] setTest:@"f" valueTo:NO];
    [[InjectTestObjC session] setTest:@"g" valueTo:NO];
    [[InjectTestObjC session] setTest:@"e" valueTo:NO];

    NSArray *sortedNames = [InjectTestObjC session].sortedTestCaseNames;
    
    NSArray *comparisonArray = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g"];
    
    XCTAssert([sortedNames isEqualToArray:comparisonArray]);
}

- (void) testTestDoesNotRunByDefault {
    BOOL testRan = NO;
    InjectTestIf(@"Test1", {
        testRan = YES;
    });
    XCTAssert(!testRan);
}

- (void) testTestRunsIfYouTurnItOn {
    [[InjectTestObjC session] setTest:@"Test1" valueTo:YES];
    BOOL testRan = NO;
    InjectTestIf(@"Test1", {
        testRan = YES;
    });
    XCTAssert(testRan);
}

- (void) testTestOnlyRunOnceIfYouTurnItOn {
    [[InjectTestObjC session] setTest:@"Test1" valueTo:YES];
    
    BOOL testRan = NO;
    InjectTestIf(@"Test1", {
        testRan = YES;
    });
    XCTAssert(testRan);
    
    testRan = NO;
    InjectTestIf(@"Test1", {
        testRan = YES;
    });
    XCTAssert(!testRan);
}

- (void) testTestRunMoreThanOnceIfYouAllowIt {
    [InjectTestObjC session].runTestsMultipleTimes = YES;
    [[InjectTestObjC session] setTest:@"Test1" valueTo:YES];
    
    BOOL testRan = NO;
    InjectTestIf(@"Test1", {
        testRan = YES;
    });
    XCTAssert(testRan);
    
    testRan = NO;
    InjectTestIf(@"Test1", {
        testRan = YES;
    });
    XCTAssert(testRan);
}

- (void) testMultipleStatementsRun {
    [[InjectTestObjC session] setTest:@"Test1" valueTo:YES];
    
    BOOL testRan = NO;
    BOOL testRan2 = NO;
    
    InjectTestIf(@"Test1",
        testRan = YES;
        testRan2 = YES;
    );
    
    XCTAssert(testRan);
    XCTAssert(testRan2);
}

- (void) testMultipleStatementsDoNotRun {
    BOOL testRan = NO;
    BOOL testRan2 = NO;
    
    InjectTestIf(@"Test1",
        testRan = YES;
        testRan2 = YES;
    );
    
    XCTAssert(!testRan);
    XCTAssert(!testRan2);
}

@end
