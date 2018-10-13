//
//  MobiNetworkService.swift
//  MobiWeather
//
//  Created by Parth Adroja on 10/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import Foundation
import Moya_ObjectMapper
import Moya
import ObjectMapper

final class MobiNetworkService {
    
    private init() {}
    
    static let shared = MobiNetworkService()
    
    var weatherApiProvider = MoyaProvider<MobiAPIProvider>(plugins: [NetworkLoggerPlugin(verbose: MobiConsts.currentConfiguration == .dev ? true : false)])
    
    func requestObject<T: Mappable, TT:TargetType, P: MoyaProvider<TT>>(provider:P,
                                                                     type:TT,
                                                                     success: @escaping ((T) -> Void),
                                                                     failure: @escaping ((Error) -> Void)) {
        provider.request(type) { (result) in
            switch result {
            case let .success(response):
                do {
                    let _ = try response.filterSuccessfulStatusCodes()
                    let modelObj = try response.mapObject(T.self)
                    success(modelObj)
                } catch {
                    print("Handle Error")
                }
            case let .failure(error):
                print("Handle Error = \(error)")
            }
        }
    }
    
    class func getStubbedResponses(fileName: String) -> Data! {
        @objc class TestClass: NSObject { }
        let bundle = Bundle(for: TestClass.self)
        let path = bundle.path(forResource: fileName, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
}
