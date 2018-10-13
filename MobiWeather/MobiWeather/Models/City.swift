//
//  City.swift
//  MobiWeather
//
//  Created by Parth Adroja on 12/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import Foundation
import ObjectMapper

class City: Mappable {
    
    var id: Int?
    var population: Int?
    var country: String?
    var name: String?
    var coord: WeatherLocation?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        population <- map["population"]
        country <- map["country"]
        name <- map["name"]
        coord <- map["coord"]
    }
}
