//
//  Double.swift
//  MobiWeather
//
//  Created by Parth Adroja on 11/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import Foundation

extension Double {
    
    func getTemperatureString() -> String {
        let formula = (self - 273.15).rounded(toPlaces: 1)
        return "\(formula)°"
    }
    
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
