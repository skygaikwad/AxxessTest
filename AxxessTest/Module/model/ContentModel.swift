//
//  ContentModel.swift
//  AxxessTest
//
//  Created by apple on 7/11/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation

// MARK: - ContentModel
struct ContentModel: Codable {
    let id: String?
    let type: ContentTypeEnum?
    let date: String?
    let data: String?
}

enum ContentTypeEnum: String, Codable {
    case image = "image"
    case other = "other"
    case text = "text"
}
