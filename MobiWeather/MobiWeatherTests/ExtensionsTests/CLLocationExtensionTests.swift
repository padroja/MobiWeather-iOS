//
//  CLLocationExtensionTests.swift
//  MobiWeatherTests
//
//  Created by Parth Adroja on 13/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import XCTest
import CoreLocation
@testable import MobiWeather_Dev

class CLLocationExtensionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetLocationString() {
        let location = CLLocationCoordinate2D(latitude: 35.04, longitude: 72.05)
        let locationString = location.getLocationString()
        let actualString = "35.04,72.05"
        XCTAssertTrue(locationString == actualString)
    }
}
