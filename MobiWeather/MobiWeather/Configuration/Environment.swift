//
//  Environment.swift
//  MobiWeather
//
//  Created by Parth Adroja on 10/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import Foundation

enum Environment: String {
    
    case dev = "Dev"
    case release = "Release"
    case stage = "Stage"
    
    var openWeatherApiKey: String {
        switch self {
        case .dev, .release, .stage: return "af6d90bab7b3cc33a2df5e6a7ea1aafc"
        }
    }
}
