//
//  MobiWeatherTests.swift
//  MobiWeatherTests
//
//  Created by Parth Adroja on 10/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import XCTest
@testable import MobiWeather_Dev

class MobiWeatherTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTemperatureConversion() {
        let expectedValue = "30.0°"
        let tempKelvin = 303.15
        let actualValue = tempKelvin.getTemperatureString()
        XCTAssertTrue(expectedValue == actualValue)
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
