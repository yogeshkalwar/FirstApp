//
//  FileServiceTest.swift
//  FirstAppTests
//
//  Created by Yogesh Kalwar on 30/09/19.
//  Copyright © 2019 Yogesh Kalwar. All rights reserved.
//

import XCTest
@testable import FirstApp

class FileServiceTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchConverter_validJson_shouldWork() {
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
        FileService().fetchConverter("EUR", completion: completion)
    }
}
