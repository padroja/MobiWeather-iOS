//
//  String.swift
//  MobiWeather
//
//  Created by Parth Adroja on 10/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import Foundation

extension String {
    
    var toUrl: URL {
        return URL(string: self)!
    }
    
    var getCoordinates: (lat: String, lon: String) {
        let coordinates = self.components(separatedBy: ",")
        return (lat: coordinates.first!, lon: coordinates.last!)
    }
}
