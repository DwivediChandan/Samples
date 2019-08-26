//
//  ItemCelltests.swift
//  NetworkRequestTests
//
//  Created by Administrator on 8/26/19.
//  Copyright © 2019 Administrator. All rights reserved.
//

import XCTest
@testable import NetworkRequest
class ItemCelltests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_ItemLabels() {
        let sut = ItemCell()
        
        let labelItemName = sut.ItemName
        labelItemName.text = "ItemName"
        XCTAssertEqual(labelItemName.text, "ItemName")
        
        let labelItemPriceTag = sut.ItemPriceTag
        XCTAssertEqual(labelItemPriceTag.text, "Price")
        
        let labelItemPrice = sut.ItemPrice
        labelItemPrice.text = "100"
        XCTAssertEqual(labelItemPrice.text, "100")
        
        let labelItemInStockTag = sut.ItemInStockTag
        XCTAssertEqual(labelItemInStockTag.text, "In stock")
        
        let labelItemInStock = sut.ItemInStock
        labelItemInStock.text = "1"
        XCTAssertEqual(labelItemInStock.text, "1")
    }

}
