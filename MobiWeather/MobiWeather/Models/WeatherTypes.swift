//
//  WeatherTypes.swift
//  MobiWeather
//
//  Created by Parth Adroja on 12/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import Foundation
import UIKit

enum WeatherTypes: String {
    
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case scatteredClouds = "scattered clouds"
    case brokenClouds = "broken clouds"
    case showerRain = "shower rain"
    case rain = "rain"
    case thunderstorm = "thunderstorm"
    case snow = "snow"
    case mist = "mist"
    case haze = "haze"
}

extension WeatherTypes {
    
    var icon: UIImage? {
        switch self {
        case .clearSky: return UIImage(named: "img_sunny")
        case .fewClouds: return UIImage(named: "img_cloud_day")
        case .scatteredClouds: return UIImage(named: "img_cloudy_night")
        case .brokenClouds: return UIImage(named: "img_cloudy")
        case .showerRain, .rain: return UIImage(named: "img_rain")
        case .thunderstorm: return UIImage(named: "img_storm")
        case .snow: return UIImage(named: "img_snow")
        case .mist, .haze: return UIImage(named: "img_clear_night")
        }
    }
}
