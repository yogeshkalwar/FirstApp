//
//  ParserHelperTest.swift
//  FirstAppTests
//
//  Created by Yogesh Kalwar on 29/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import XCTest
@testable import FirstApp

class ParserHelperTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParse_ResponseEmpty_shouldFail() {
        let data = Data()
        let completion: ((Result<CurrencyConverter, ErrorResult>) -> Void) = { result in
            switch result {
            case .success(_):
                XCTAssert(false, "Empty data, should fail and should not call success")
                break
            case .failure(_):
                XCTAssert(true, "Empty data, should call failure")
                break
            default:
                break
            }
        }
        ParserHelper.parse(data: data, completion: completion)
    }
    
    func testParse_ValidResponse_shouldSuccess() throws {
        //let bundle = Bundle(for: type(of: self))
        guard let data = FileManager.readJson(forResource: "response", forClass: ParserHelperTest.self) else {
            XCTAssert(false, "something wrong with response.json file")
            return
        }
        //let data = try Data(contentsOf: URL(fileURLWithPath: url), options: .mappedIfSafe)
        let completion: ((Result<CurrencyConverter, ErrorResult>) -> Void) = { result in
            switch result {
            case .success(let converter):
                XCTAssertEqual(converter.mBase, "EUR", "Expected base")
                XCTAssertEqual(converter.mDate, "2019-09-29", "Expected date")
                XCTAssertEqual(converter.mRates.count, 5, "Expected count")
                break
            case .failure(_):
                XCTAssert(false, "Should give valid converter.")
                break
            default:
                break
            }
        }
        ParserHelper.parse(data: data, completion: completion)
    }
}
