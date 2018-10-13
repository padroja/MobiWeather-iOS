//
//  DoubleTests.swift
//  MobiWeatherTests
//
//  Created by Parth Adroja on 13/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import XCTest
@testable import MobiWeather_Dev

class DoubleTests: XCTestCase {

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
    
    func testRounded() {
        let valueToBeRounded = 23.1234
        let actualValue = valueToBeRounded.rounded(toPlaces: 2)
        let expectedValue = 23.12
        XCTAssertTrue(expectedValue == actualValue)
    }
    
    func testKphConversion() {
        let valueToConvert = 10.0
        let actualValue = valueToConvert.toKphString()
        let expectedValue = "36.0 KPH"
        XCTAssertTrue(expectedValue == actualValue)
    }
}
