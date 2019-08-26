//
//  ViewModelTests.swift
//  NetworkRequestTests
//
//  Created by Administrator on 8/26/19.
//  Copyright © 2019 Administrator. All rights reserved.
//

import XCTest
@testable import NetworkRequest

class ViewModelTests: XCTestCase {
    var sut:ViewModel!
    override func setUp() {
       sut = ViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Init(){
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.excludedNames)
        XCTAssertNotNil(sut.selectedNames)
    }
    
    func test_getData() {
        XCTAssertNil(sut.res)
        XCTAssertTrue(sut.excludedNames?.count == 0)
        XCTAssertTrue(sut.selectedNames?.count == 0)
         let expect = expectation(description: "wait for Item data")
        sut.getData {
            expect.fulfill()
        }
         waitForExpectations(timeout: 3, handler: nil)
        XCTAssertNotNil(sut.res)
        XCTAssertTrue((sut.res?.variants.variant_groups.count)! > 0)
    }
    
    func test_GetNameAndExcludeListNameAndSelectedNameIsExcluded() {
     
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
        sut.res = item
        let name = sut.getName(groupId: "1", variantId: "1")
        XCTAssertEqual(name, "Group1Variation1")
        sut.execludeListName()
        XCTAssertTrue(sut.excludedNames?.count == 2)
        
        let val = sut.selectedNameIsExcluded(name: "Group1Variation1")
        XCTAssertTrue(val == true)
        
        let val2 = sut.selectedNameIsExcluded(name: "Group1Variation2")
        XCTAssertTrue(val2 == false)
    }
    
    
    

}
