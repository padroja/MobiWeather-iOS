//
//  StringExtensionTests.swift
//  MobiWeatherTests
//
//  Created by Parth Adroja on 13/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import XCTest
@testable import MobiWeather_Dev

class StringExtensionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStringToURL() {
        let urlString = "http://openweathermap.org/img/w/50d.png"
        let url = urlString.toUrl
        XCTAssertNotNil(url)
    }
    
    func testGetLatLon() {
        let latLonString = "35,139"
        let lat = latLonString.getCoordinates.lat
        let lon = latLonString.getCoordinates.lon
        XCTAssertTrue((lat == "35" && lon == "139"))
    }
}
