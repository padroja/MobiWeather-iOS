//
//  Configuration.swift
//  MobiWeather
//
//  Created by Parth Adroja on 10/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import Foundation

struct Configuration {
    lazy var environment: Environment = {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            if configuration.range(of: "Dev") != nil {
                return .dev
            } else if configuration.range(of: "Stage") != nil {
                return .stage
            }
        }
        
        return .release
    }()
}
