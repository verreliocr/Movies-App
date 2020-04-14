//
//  MovieListModels.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

struct MovieListModel: Codable {
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    var results: [MovieListModelResult] = []
}

private extension MovieListModel {
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results = "results"
    }
}

struct MovieListModelResult: Codable {
    var id: Int?
    var posterPath: String?
    var title: String?
    var voteAverage: Double?
    var overview: String?
    var releaseDate: String?
}

private extension MovieListModelResult {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterPath = "poster_path"
        case title = "title"
        case voteAverage = "vote_average"
        case overview = "overview"
        case releaseDate = "release_date"
    }
}
