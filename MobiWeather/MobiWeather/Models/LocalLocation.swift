//
//  LocalLocation.swift
//  MobiWeather
//
//  Created by Parth Adroja on 11/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

struct LocalLocation: Codable, DefaultsSerializable {
    
    var cityName: String
    var location: String
}
