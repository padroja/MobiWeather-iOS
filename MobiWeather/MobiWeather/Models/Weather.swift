//
//  Weather.swift
//  MobiWeather
//
//  Created by Parth Adroja on 10/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import Foundation
import ObjectMapper

class Weather: Mappable {
    
    var coord: WeatherLocation?
    var weatherTypes: [WeatherType]?
    var base: String?
    var main: WeatherMain?
    var visibility: Double?
    var wind: Wind?
    var clouds: Clouds?
    var dt: Int?
    var sys: WeatherSys?
    var id: Int?
    var name: String?
    var cod: Int?

    required init?(map: Map) {}
    
    func mapping(map: Map) {
        coord <- map["coord"]
        weatherTypes <- map["weather"]
        base <- map["base"]
        main <- map["main"]
        visibility <- map["visibility"]
        wind <- map["wind"]
        clouds <- map["clouds"]
        dt <- map["dt"]
        id <- map["id"]
        name <- map["name"]
        cod <- map["cod"]
    }
}

class WeatherLocation: Mappable {
    
    var lat: Double?
    var lon: Double?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        lat <- map["lat"]
        lon <- map["lon"]
    }
}

class WeatherType: Mappable {
    
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
    }
}

class WeatherMain: Mappable {
    
    var temp: Double?
    var pressure: Double?
    var humidity: Double?
    var tempMax: Double?
    var tempMin: Double?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        temp <- map["temp"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        tempMax <- map["temp_min"]
        tempMin <- map["temp_max"]
    }
}

class Wind: Mappable {
    
    var speed: Double?
    var deg: Double?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        speed <- map["speed"]
        deg <- map["deg"]
    }
}

class Clouds: Mappable {
    
    var all: Double?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        all <- map["all"]
    }
}

class WeatherSys: Mappable {
    
    var type: Double?
    var id: Double?
    var message: Double?
    var country: String?
    var sunrise: String?
    var sunset: Double?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
    }
}
