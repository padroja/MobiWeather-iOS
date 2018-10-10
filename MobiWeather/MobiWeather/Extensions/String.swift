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
}
