//
//  MovieListModels.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

struct ListMovieModel: Codable {
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    var results: [ListMovieModelResult] = []
}

private extension ListMovieModel {
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results = "results"
    }
}

struct ListMovieModelResult: Codable {
    var id: Int?
    var backdropPath: String?
    var title: String?
    var voteAverage: Double?
    var overview: String?
    var releaseDate: String?
}

private extension ListMovieModelResult {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case backdropPath = "backdrop_path"
        case title = "title"
        case voteAverage = "vote_average"
        case overview = "overview"
        case releaseDate = "release_date"
    }
}
