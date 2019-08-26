//
//  ModelTests.swift
//  NetworkRequestTests
//
//  Created by Administrator on 8/26/19.
//  Copyright © 2019 Administrator. All rights reserved.
//

import XCTest
@testable import NetworkRequest
class ModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_InitAll() {
        let variation = Variations(name: "Variation1", price: 100, default: 1, id: "1", inStock: 1, isVeg: 1)
        XCTAssertNotNil(variation)
        let group = Group(group_id: "1", name: "Group1", variations: [variation])
        XCTAssertNotNil(group)
        XCTAssertEqual(group.variations[0].name, variation.name)
        let exclude = Exclude(group_id: "1", variation_id: "1")
        XCTAssertNotNil(exclude)
        let variantData = VariantData(variant_groups: [group], exclude_list: [[exclude]])
        XCTAssertNotNil(variantData)
        let item = Items(variants: variantData)
        XCTAssertNotNil(item)
        
    }

}
