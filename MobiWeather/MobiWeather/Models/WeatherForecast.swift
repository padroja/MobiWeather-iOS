//
//  WeatherForecast.swift
//  MobiWeather
//
//  Created by Parth Adroja on 12/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherForecast: Mappable {
    
    var cnt: Int?
    var message: Int?
    var cod: Int?
    var city: City?
    var list: [Weather]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        cnt <- map["cnt"]
        message <- map["message"]
        cod <- map["cod"]
        city <- map["city"]
        list <- map["list"]
    }
}
