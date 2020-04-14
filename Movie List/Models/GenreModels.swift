//
//  GenreModels.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

struct GenreModel: Codable {
    var genres: [GenreModelItems] = []
}

private extension GenreModel {
    enum CodingKeys: String, CodingKey {
        case genres = "genres"
    }
}

struct GenreModelItems: Codable {
    var id: String
    var name: String
}

private extension GenreModelItems {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}
