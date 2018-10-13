//
//  CLLocationCoordinate2D.swift
//  MobiWeather
//
//  Created by Parth Adroja on 11/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D {
    
    func getLocationString() -> String {
        return "\(latitude),\(longitude)"
    }
}
