//
//  Dictionary.swift
//  MobiWeather
//
//  Created by Parth Adroja on 11/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import Foundation

extension Dictionary {
    
    func toData() -> Data {
        let jsonData = try! JSONSerialization.data(withJSONObject: self, options: [])
        return jsonData
    }
    
    func getLocalLocationModel() -> LocalLocation {
        let decoder = JSONDecoder()
        let model = try! decoder.decode(LocalLocation.self, from: self.toData())
        return model
    }
}
