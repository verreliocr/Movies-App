//
//  VideosModels.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

enum VideoType: String, Codable, CaseIterableDefaultsLast {
    case trailer = "Trailer"
    case teaser = "Teaser"
    case clip = "Clip"
    case featurette = "Featurette"
    case bts = "Behind the Scenes"
    case bloopers = "Bloopers"
    case unknown
    
    var isTrailer: Bool {
        return self == .trailer
    }
}

struct VideosModel: Codable {
    var id: Int?
    var results: [VideosModelResults] = []
}

private extension VideosModel {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case results = "results"
    }
}

struct VideosModelResults: Codable {
    var id: String?
    var key: String?
    var name: String?
    var site: String?
    var type: VideoType?
}

private extension VideosModelResults {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case key = "key"
        case name = "name"
        case site = "site"
        case type = "type"
    }
}
