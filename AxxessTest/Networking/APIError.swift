//
//  APIError.swift
//  AxxessTest
//
//  Created by apple on 7/11/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation


enum APIErrors: String, Error {
    case invalidJSON = "Fail to decode JSON"
    case noResponse = "Didn't received any response"
    case networkFail = "Network Failed"
    case invalidData = "Sorry. Somthing went wrong, try again"
    case invalidResponse = "Server error. Please modify your search and try again"
    case invalidOfflineData = "No Offline data available"
}
