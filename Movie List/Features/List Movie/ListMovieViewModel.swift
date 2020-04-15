//
//  ListMovieViewModel.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

class ListMovieViewModel {
    var genreId: Int
    var genreName: String
    var page: Int = 1
    var currentPage: Int = 0
    var totalPages: Int = 0
    var totalElements: Int = 0
    var allowRequestNextPage: Bool = true
    var movies: [ListMovieModelResult] = []
    
    init(genreId: Int, genreName: String) {
        self.genreId = genreId
        self.genreName = genreName
    }
}
