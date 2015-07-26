//
//  Pangu_Objective_CTests.m
//  Pangu.Objective-CTests
//
//  Created by Cee on 26/07/2015.
//  Copyright (c) 2015 Cee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSString+Pangu.h"

@interface Pangu_Objective_CTests : XCTestCase

@end

@implementation Pangu_Objective_CTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSpacingText {
    XCTAssertEqualObjects([NSString spacing:@"請問Jackie的鼻子有幾個？123個！"], @"請問 Jackie 的鼻子有幾個？123 個！");
    XCTAssertEqualObjects([NSString spacing:@"請問 Jackie 的鼻子有幾個？123 個！"], @"請問 Jackie 的鼻子有幾個？123 個！");
}


- (void)testTilde {
    XCTAssertEqualObjects([NSString spacing:@"前面~後面"], @"前面 ~ 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面 ~ 後面"], @"前面 ~ 後面");
}


- (void)testBackQuote {
    XCTAssertEqualObjects([NSString spacing:@"前面`後面"], @"前面 ` 後面");
}


- (void)testExclamationMark {
    XCTAssertEqualObjects([NSString spacing:@"前面!後面"], @"前面! 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面! 後面"], @"前面! 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面 ! 後面"], @"前面 ! 後面");
}


- (void)testAt1 {
    XCTAssertEqualObjects([NSString spacing:@"請@vinta吃大便"], @"請 @vinta 吃大便");
}


- (void)testAt2 {
    XCTAssertEqualObjects([NSString spacing:@"請@陳上進 吃大便"], @"請 @陳上進 吃大便");
}


- (void)testHash1 {
    XCTAssertEqualObjects([NSString spacing:@"前面#H2G2後面"], @"前面 #H2G2 後面");
}


- (void)testHash2 {
    XCTAssertEqualObjects([NSString spacing:@"前面#銀河便車指南 後面"], @"前面 #銀河便車指南 後面");
}


- (void)testHash3 {
    XCTAssertEqualObjects([NSString spacing:@"前面#銀河公車指南 #銀河大客車指南 後面"], @"前面 #銀河公車指南 #銀河大客車指南 後面");
}


- (void)testHash4 {
    XCTAssertEqualObjects([NSString spacing:@"前面#銀河閃電霹靂車指南#後面"], @"前面 #銀河閃電霹靂車指南# 後面");
}


- (void)testDollar {
    XCTAssertEqualObjects([NSString spacing:@"前面$後面"], @"前面 $ 後面");
}


- (void)testPercent {
    XCTAssertEqualObjects([NSString spacing:@"前面%後面"], @"前面 % 後面");
}


- (void)testCarat {
    XCTAssertEqualObjects([NSString spacing:@"前面^後面"], @"前面 ^ 後面");
}


- (void)testAmpersand {
    XCTAssertEqualObjects([NSString spacing:@"前面&後面"], @"前面 & 後面");
}


- (void)testAsterisk {
    XCTAssertEqualObjects([NSString spacing:@"前面*後面"], @"前面 * 後面");
}


- (void)testParenthesis {
    XCTAssertEqualObjects([NSString spacing:@"前面(後面"], @"前面 ( 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面 ( 後面"], @"前面 ( 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面)後面"], @"前面 ) 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面 ) 後面"], @"前面 ) 後面");
}


- (void)testParenthesisPair {
    XCTAssertEqualObjects([NSString spacing:@"前面(中文123漢字)後面"], @"前面 (中文 123 漢字) 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面(中文123)後面"], @"前面 (中文 123) 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面(123漢字)後面"], @"前面 (123 漢字) 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面(中文123漢字) tail"], @"前面 (中文 123 漢字) tail");
    
    XCTAssertEqualObjects([NSString spacing:@"head (中文123漢字)後面"], @"head (中文 123 漢字) 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"head (中文123漢字) tail"], @"head (中文 123 漢字) tail");
}


- (void)testMinus {
    XCTAssertEqualObjects([NSString spacing:@"前面-後面"], @"前面 - 後面");
}


- (void)testUnderscore {
    XCTAssertEqualObjects([NSString spacing:@"前面_後面"], @"前面 _ 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面 _ 後面"], @"前面 _ 後面");
}


- (void)testPlus {
    XCTAssertEqualObjects([NSString spacing:@"前面+後面"], @"前面 + 後面");
}


- (void)testEqual {
    XCTAssertEqualObjects([NSString spacing:@"前面=後面"], @"前面 = 後面");
}


- (void)testBrace {
    XCTAssertEqualObjects([NSString spacing:@"前面{後面"], @"前面 { 後面");
}


- (void)testBracket {
    XCTAssertEqualObjects([NSString spacing:@"前面[後面"], @"前面 [ 後面");
}


- (void)testPipe {
    XCTAssertEqualObjects([NSString spacing:@"前面|後面"], @"前面 | 後面");
}


- (void)testBackslash {
    XCTAssertEqualObjects([NSString spacing:@"前面\\後面"], @"前面 \\ 後面");
}


- (void)testColon {
    XCTAssertEqualObjects([NSString spacing:@"前面:後面"], @"前面: 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面: 後面"], @"前面: 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面 : 後面"], @"前面 : 後面");
}


- (void)testSemicolon {
    XCTAssertEqualObjects([NSString spacing:@"前面;後面"], @"前面; 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面; 後面"], @"前面; 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面 ; 後面"], @"前面 ; 後面");
}


- (void)testQuote {
    XCTAssertEqualObjects([NSString spacing:@"前面\"後面"], @"前面 \" 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面\"中文123漢字\"後面"], @"前面 \"中文 123 漢字\" 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面\"\"後面"], @"前面 \"\" 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面\" \"後面"], @"前面 \" \" 後面");
}


- (void)testSingleQuote {
    XCTAssertEqualObjects([NSString spacing:@"前面'後面"], @"前面 ' 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面'中文123漢字'後面"], @"前面 '中文 123 漢字' 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面''後面"], @"前面 '' 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面' '後面"], @"前面 ' ' 後面");
}


- (void)testLessThan {
    XCTAssertEqualObjects([NSString spacing:@"前面<後面"], @"前面 < 後面");
}


- (void)testComma {
    XCTAssertEqualObjects([NSString spacing:@"前面,後面"], @"前面, 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面, 後面"], @"前面, 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面, 後面"], @"前面, 後面");
}


- (void)testGreaterThan {
    XCTAssertEqualObjects([NSString spacing:@"前面>後面"], @"前面 > 後面");
}


- (void)testPeriod {
    XCTAssertEqualObjects([NSString spacing:@"前面.後面"], @"前面. 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面. 後面"], @"前面. 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面. 後面"], @"前面. 後面");
}


- (void)testQuestionMark {
    XCTAssertEqualObjects([NSString spacing:@"前面?後面"], @"前面? 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面? 後面"], @"前面? 後面");
    
    XCTAssertEqualObjects([NSString spacing:@"前面? 後面"], @"前面? 後面");
}


- (void)testSlash {
    XCTAssertEqualObjects([NSString spacing:@"前面/後面"], @"前面 / 後面");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
