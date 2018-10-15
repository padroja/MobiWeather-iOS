//
//  MobiAPITests.swift
//  MobiWeatherTests
//
//  Created by Parth Adroja on 15/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import XCTest
import Moya
import Moya_ObjectMapper
import ObjectMapper
@testable import MobiWeather_Dev

class MobiAPITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
    }
    
    func testWeatherAPICall() {
        MobiNetworkService.shared.requestObject(provider: MobiNetworkService.shared.testApiProvider,
                                                type: MobiAPIProvider.getWeather(params: [:]), success: { (model: Weather) in
                                                    XCTAssertNotNil(model)
        }) { (error) in
        }
    }
}
