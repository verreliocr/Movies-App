//
//  EndPoint.swift
//  Contacts App
//
//  Created by Verrelio C. Rizky on 13/02/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

private let baseURL = "https://api.themoviedb.org/3"
private let APIKey = "0634895be8bc7be70fe69ceef8e006cf"

enum EndPoint {
    case getListGenre
    case getDiscoverMovie(page: Int, genreId: Int)
    case getDetailMovie(id: Int)
    case getVideo(id: Int)
    case getReviews(id: Int, page: Int)
    
    var method: HTTPMethod {
        switch self {
        default:
            return .GET
        }
    }
    
    var url: String {
        var path = ""
        switch self {
        case .getListGenre:
            path = "/genre/movie/list?api_key=\(APIKey)"
        case .getDiscoverMovie(let page, let genreId):
            path = "/discover/movie?api_key=\(APIKey)&page=\(page)&with_genres=\(genreId)"
        case .getDetailMovie(let id):
            path = "/movie/\(id)?api_key=\(APIKey)"
        case .getVideo(let id):
            path = "/movie/\(id)/videos?api_key=\(APIKey)"
        case .getReviews(let id, let page):
            path = "/movie/\(id)/reviews?api_key=\(APIKey)&page=\(page)"
        }
        
        return baseURL + path
    }
}
