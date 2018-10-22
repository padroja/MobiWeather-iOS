//
//  DictionaryTests.swift
//  MobiWeatherTests
//
//  Created by Parth Adroja on 13/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import XCTest
@testable import MobiWeather_Dev

class DictionaryTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLocalLocationDict() {
        let locationDict = ["cityName": "Pune",
                            "location": "35.98,74.05"]
        let convertedModel = locationDict.getLocalLocationModel()
        let actualCity = convertedModel.cityName == "Pune"
        let actualLocation = convertedModel.location == "35.98,74.05"
        XCTAssertTrue(actualCity && actualLocation)
    }
}
