//
//  ViewControllerTests.swift
//  NetworkRequestTests
//
//  Created by Administrator on 8/25/19.
//  Copyright © 2019 Administrator. All rights reserved.
//

import XCTest
@testable import NetworkRequest

class ViewControllerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_ViewDidLoad() {
        let sut = ViewController()
        XCTAssertNil(sut.itemTableView)
        let expect = expectation(description: "wait for Item data")
        _ = sut.view
        XCTAssertNotNil(sut.viewModel)
        sut.viewModel?.getData {
            sut.initTable()
            expect.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(sut.itemTableView)
        
    }
    func test_InitTableView() {
        let sut = ViewController()
        _ = sut.view
        sut.initTable()
        XCTAssertNotNil(sut.itemTableView)
         XCTAssertNotNil(sut.itemTableView?.dataSource)
         XCTAssertTrue(sut.itemTableView?.dataSource is ViewController)
        XCTAssertNotNil(sut.itemTableView?.delegate)
    }


}
