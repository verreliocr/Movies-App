//
//  ReviewsModels.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

struct ReviewsModel: Codable {
    var id: Int?
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    var results: [ReviewsModelResults] = []
}

private extension ReviewsModel {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results = "results"
    }
}

struct ReviewsModelResults: Codable {
    var author: String?
    var content: String?
    var id: String?
    var url: String?
}

private extension ReviewsModelResults {
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case content = "content"
        case id = "id"
        case url = "url"
    }
}
