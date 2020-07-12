//
//  APIManager.swift
//  AxxessTest
//
//  Created by apple on 7/11/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import Moya
import Alamofire


// MARK: - Networkable Protocol

protocol APINetworkable {
    
    func excuteRequest(withAPI API: APIRequests, completionHandler: @escaping (_ response: Result<[ContentModel]?, APIErrors >)-> Void)
    
}

// MARK:- Single Initate Moya Provider
private var appApiProvider: MoyaProvider<APIRequests> = MoyaProvider<APIRequests>(plugins: [
    NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
])

// MARK: - API Manager

struct APIManager : APINetworkable {
        

    var apiProvider: MoyaProvider<APIRequests>
    
    init() {
            apiProvider = appApiProvider
    }
    
    func excuteRequest(withAPI API: APIRequests, completionHandler: @escaping (Result<[ContentModel]?, APIErrors>) -> Void) {
        guard NetworkReachabilityManager()?.isReachable == true else {
            let apiError = APIErrors.networkFail
            completionHandler(.failure(apiError))
            return
        }
        apiProvider.request(API) { (result) in
            switch result  {
            case .success(let response):
                let apiModel = try? response.map([ContentModel].self)
                completionHandler(.success(apiModel))
            case .failure( _):
                let apiError = APIErrors.noResponse
                completionHandler(.failure(apiError))
            }
        }
    }

    
}
