//
//  InjectionTestObjcTests2.m
//  roster
//
//  Created by Christopher G Prince on 8/9/17.
//  Copyright © 2017 roster. All rights reserved.
//

// Make sure tests won't run if you don't have DEBUG set.

#import <XCTest/XCTest.h>

#undef DEBUG
#import "InjectTestObjC.h"

@interface InjectionTestObjcTests2 : XCTestCase
@end

@implementation InjectionTestObjcTests2

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testDoesNotRunWithDEBUGNotDefined {
    [[InjectTestObjC session] setTest:@"Test1" valueTo:YES];
    
    BOOL testRan = NO;
    InjectTestIf(@"Test1", {
        testRan = YES;
    });
    
    XCTAssert(!testRan);
}

@end
