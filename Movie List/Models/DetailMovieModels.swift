//
//  DetailMovieModels.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

struct DetailMovieModel: Codable {
    var id: Int?
    var posterPath: String?
    var title: String?
    var voteAverage: Double?
    var voteCount: Int?
    var overview: String?
    var releaseDate: String?
    var genres: [GenreModelItem]?
}

private extension DetailMovieModel {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterPath = "poster_path"
        case title = "title"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case overview = "overview"
        case releaseDate = "release_date"
        case genres = "genres"
    }
}
