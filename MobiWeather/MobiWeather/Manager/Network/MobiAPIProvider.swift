//
//  MobiAPIProvider.swift
//  MobiWeather
//
//  Created by Parth Adroja on 10/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import Foundation
import Moya

enum MobiAPIProvider {
    case getWeather(params: [String : Any])
}

extension MobiAPIProvider: TargetType {
    
    var baseURL: URL {
        return MobiConsts.currentConfiguration.baseUrl.toUrl
    }
    
    var path: String {
        switch self {
        case .getWeather: return "weather"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getWeather: return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getWeather(var params):
            params["appid"] = MobiConsts.currentConfiguration.openWeatherApiKey
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }    
}
