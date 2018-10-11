//
//  LocalStorageManager.swift
//  MobiWeather
//
//  Created by Parth Adroja on 11/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    static let storedLocations = DefaultsKey<[LocalLocation]>("storedLocations", defaultValue: [])
}

class LocalStorageManager {
    
    class func add(location: LocalLocation) {
        Defaults[.storedLocations].append(location)
    }
    
    class func getLocations() -> [LocalLocation]? {
        return Defaults[.storedLocations]
    }
    
    class func remove(location: LocalLocation) {
        Defaults[.storedLocations].removeAll { (obj) -> Bool in
            return obj.cityName == location.cityName && obj.location == location.location
        }
    }
}
