//
//  GenreModels.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

struct GenreModel: Codable {
    var genres: [GenreModelItem] = []
}

private extension GenreModel {
    enum CodingKeys: String, CodingKey {
        case genres = "genres"
    }
}

struct GenreModelItem: Codable {
    var id: Int?
    var name: String?
}

private extension GenreModelItem {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}
