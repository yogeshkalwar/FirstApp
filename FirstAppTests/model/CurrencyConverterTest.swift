//
//  CurrencyConverterTest.swift
//  FirstAppTests
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import XCTest
@testable import FirstApp

class CurrencyConverterTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCurrencyConverter_WrongKey_ShouldFail() {
        
        let dictionary = ["invalid" : 111 as AnyObject]
        let result = CurrencyConverter.parseObject(dictionary: dictionary)
        
        switch result {
        case .success(_):
            XCTAssert(false, "Expected failure, not be success")
            break
        case .failure(_):
            XCTAssert(true, "Expected failure, should be called failure")
        default:
            return
        }
    }
    
    func testCurrencyConverter_ValidKey_ShouldSuccess() {
        let dictionary: [String: AnyObject] = [CurrencyMeta.BASE.rawValue: "EUR" as AnyObject,
                                               CurrencyMeta.DATE.rawValue: "2019-09-29" as AnyObject,
                                               CurrencyMeta.RATES.rawValue: ["AED":4.018865] as AnyObject]
        
        let result = CurrencyConverter.parseObject(dictionary: dictionary)
        
        switch result {
        case .success(let converter):
            XCTAssert(true, "Expected success, should be success")
            XCTAssertEqual(converter.mBase, "EUR", "Expected base")
            XCTAssertEqual(converter.mDate, "2019-09-29", "Expected base")
            XCTAssertEqual(converter.mRates.count, 1, "Expected count")
            break
        default:
            return
        }
    }
}
