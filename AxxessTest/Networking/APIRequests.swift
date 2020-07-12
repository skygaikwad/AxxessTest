//
//  APIRequests.swift
//  AxxessTest
//
//  Created by apple on 7/11/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import Moya

// MARK: - Add API Paths

enum APIRequests {
    //    static private let privateSessionKey = "YOUR PRIVATE KEY"
    
    case getContents
    
}




// MARK: - Create Request for API Paths

extension APIRequests : TargetType {
    var baseURL: URL {
        return URL(string: "https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/")!
    }
    
    var path: String {
        switch self {
        case .getContents:
            return "master/challenge.json"
            
            
        }
    }
    
    var method: Moya.Method {
        switch self {
//        case .getContents:
//            return .post
            
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getContents:
            return stubbedResponse("contentData") ?? Data()
            
        default:
            return Data()
        }
    }
    
    
    
    var task: Task {
        switch self {
            
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        let heads = ["Content-Type": "application/json"]
        switch self {
        case .getContents:
            return heads
            
        default:
            return heads
        }
        
    }
    
    
    
    var validationType: ValidationType {
        
        return .successCodes
    }
    
    
}

// MARK: - Provider support

private func stubbedResponse(_ filename: String) -> Data? {
    @objc class TestClass: NSObject { }
    let bundle = Bundle(for: TestClass.self)
    guard let path = bundle.path(forResource: filename, ofType: "json") else { return nil }
    return (try? Data(contentsOf: URL(fileURLWithPath: path)))
}

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}






