//
//  AppleNews.swift
//  ScrollView_TableView_Difference_Practice
//
//  Created by 황홍필 on 2023/07/05.
//

import Foundation

// MARK: - AppleNew
struct AppleData: Codable {
    let category: Category
    let datetime: Int
    let headline: String
    let id: Int
    let image: String
    let related: Related
    let source, summary: String
    let url: String
    
    var imageSDURL: URL? {
        guard let url = URL(string: image) else { return URL(string: "") }
        return url
    }
    
}

enum Category: String, Codable {
    case company = "company"
}

enum Related: String, Codable {
    case aapl = "AAPL"
}

typealias AppleNews = [AppleData]

